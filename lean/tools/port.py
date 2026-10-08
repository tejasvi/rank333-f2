#!/usr/bin/env python3
"""port.py LIST DST: mechanical module-system port ((B+), PROOF_OBJECT.md §10) of the non-module Lean files in LIST
(lines "Module /abs/path.lean", closure order) into DST/<Module path>.lean:
  1. `module` as the first command;
  2. every `import X` -> `public import X` (comments in the header kept);
  3. a module doc comment `/-! ... -/` found before or between the imports moves after them (module files require it);
  4. the body is wrapped in `@[expose] public section` (closed implicitly at end of file), so every declaration stays public
     with an exposed body, as in non-module Lean.
Files that define elaborators/macros/syntax or call addDecl are listed on stderr (they need the manual rules of §10)."""
import os,re,sys
HAZ=re.compile(r'^(elab|macro|syntax|elab_rules|macro_rules|initialize|builtin_initialize)\b|addDecl|compileDecl',re.M)
def split_header(s):
    i=0; n=len(s); hdr=[]; docs=[]
    while i<n:
        if s.startswith('/-',i):
            j=s.find('-/',i)+2
            depth=s.count('/-',i,j)-0
            # nested comments: find the matching end
            k=i+2; d=1
            while d>0:
                a=s.find('/-',k); b=s.find('-/',k)
                if a!=-1 and a<b: d+=1; k=a+2
                else: d-=1; k=b+2
            blk=s[i:k]
            (docs if blk.startswith('/-!') else hdr).append(blk); i=k; continue
        if s.startswith('--',i):
            j=s.find('\n',i); j=n if j<0 else j+1; hdr.append(s[i:j]); i=j; continue
        if s[i] in ' \t\r\n': hdr.append(s[i]); i+=1; continue
        m=re.match(r'import\s+(\S+)[^\n]*\n?',s[i:])
        if m: hdr.append('public import %s\n'%m.group(1)); i+=m.end(); continue
        break
    return ''.join(hdr), docs, s[i:]
def port(src,dst):
    s=open(src).read()
    hdr,docs,body=split_header(s)
    out='module\n'+hdr.rstrip('\n')+'\n'+''.join(d+'\n' for d in docs)+'@[expose] public section\n'+body
    os.makedirs(os.path.dirname(dst),exist_ok=True); open(dst,'w').write(out)
    return bool(HAZ.search(body))
if __name__=='__main__':
    dstroot=sys.argv[2]; haz=[]
    for l in open(sys.argv[1]):
        m,p=l.split()
        if port(p,os.path.join(dstroot,*m.split('.'))+'.lean'): haz.append(m)
    print('hazard files:',' '.join(haz),file=sys.stderr)
