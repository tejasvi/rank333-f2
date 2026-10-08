#!/usr/bin/env python3
"""mkipcopy.py FAM IP [SRCDIR MODPREFIX]: module-land copy of a coset IP's constants and tables (hcls / hcap generator output),
  plus its rfl bridge.  FAM = E1P | E1G is the namespace of the IP's constants and tables.  Sources: SRCDIR/IP_<IP>.lean and
  SRCDIR/SL_<IP>.lean, modules MODPREFIX.IP_<IP>, MODPREFIX.SL_<IP>; default SRCDIR = hcls/<FAM>/, MODPREFIX = FAM
  (hcap: SRCDIR = hcap/HCap/, MODPREFIX = HCap).  Writes src/R22D/<FAM>_<IP>.lean (module: `#r22d_rttablew` of the same
  files with the same chunk sizes, verbatim copies of the IP's Nat / List Nat constants) and bridge/R22B/<FAM>_<IP>.lean
  (non-module: `#r22b_const` for every table function and constant)."""
import re,sys,os
fam,ip=sys.argv[1],sys.argv[2]
H=sys.argv[3].rstrip('/')+'/' if len(sys.argv)>3 else 'r22/lean/hcls/%s/'%fam
mp=sys.argv[4] if len(sys.argv)>4 else fam
L=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ipsrc=open(H+'IP_%s.lean'%ip).read(); slsrc=open(H+'SL_%s.lean'%ip).read()
tabs=re.findall(r'#rttablew (%s\.\w+) "([^"]+)" (\d+) (\d+)'%fam, ipsrc+'\n'+slsrc)
exts=re.findall(r'#e1ext (%s\.\w+) "([^"]+)" (\d+)'%fam, ipsrc)   # leaf2's E1 IPs: EXT loaded from a binary file
defs=[l for l in ipsrc.splitlines() if re.match(r'def \w+ : (Nat|List Nat) := ',l)]
names=[re.match(r'def (\w+) :',l).group(1) for l in defs]
mod='R22D.%s_%s'%(fam,ip)
out=['module','public meta import R22D.Load','public import R22N.Rec','@[expose] public section','set_option Elab.async false',
     '/-! Module-land copy of `%s.IP_%s` (Nat / List Nat constants, verbatim) and its tables (`#rttablew`, same files and chunk sizes). Bridge: `R22B.%s_%s`. -/'%(fam,ip,fam,ip)]
for t,f,ch,w in tabs: out.append('#r22d_rttablew R22D.%s "%s" %s %s'%(t,f,ch,w))
for x,f,k in exts: out.append('#r22d_e1ext R22D.%s "%s" %s'%(x,f,k))
out.append('namespace R22D.%s.IP_%s'%(fam,ip)); out+=defs; out.append('end R22D.%s.IP_%s'%(fam,ip))
open(L+'/src/R22D/%s_%s.lean'%(fam,ip),'w').write('\n'.join(out)+'\n')
br=['import R22B.Cmd','import %s'%mod,'import %s.IP_%s'%(mp,ip),'import %s.SL_%s'%(mp,ip),
    '/-! # R22B.%s_%s: the module-land copies of the IP `%s` equal the kernel modules `%s.IP_%s` / `%s.SL_%s` (`rfl`) -/'%(fam,ip,ip,mp,ip,mp,ip),'set_option maxRecDepth 100000']
for t,_,_,_ in tabs:
    for fn in ['chunk','entry','N']: br.append('#r22b_const R22D.%s.%s %s.%s'%(t,fn,t,fn))
for n in names: br.append('#r22b_const R22D.%s.IP_%s.%s %s.IP_%s.%s'%(fam,ip,n,fam,ip,n))
for x,_,_ in exts: br.append('#r22b_const R22D.%s.EXT %s.EXT'%(x,x))
for t,_,_,_ in tabs[-1:]: br.append('#print axioms R22B.R22D_%s_chunk_eq'%t.replace('.','_'))
for n in names[-1:]: br.append('#print axioms R22B.R22D_%s_IP_%s_%s_eq'%(fam,ip,n))
open(L+'/bridge/R22B/%s_%s.lean'%(fam,ip),'w').write('\n'.join(br)+'\n')
print(mod, len(tabs),'tables', len(names),'constants:', ' '.join(names), '+ EXT' if exts else '')
