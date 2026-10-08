module
public import R22Port.U_d41d8cd98f00
public import RT.K3eD_Data
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace RT.K3eD
open RT
theorem ok_0 : allOK 0 512 = true := by decide +kernel
theorem ok_512 : allOK 512 512 = true := by decide +kernel
theorem ok_1024 : allOK 1024 512 = true := by decide +kernel
theorem ok_1536 : allOK 1536 512 = true := by decide +kernel
theorem ok_2048 : allOK 2048 512 = true := by decide +kernel
theorem ok_2560 : allOK 2560 512 = true := by decide +kernel
theorem ok_3072 : allOK 3072 512 = true := by decide +kernel
theorem ok_3584 : allOK 3584 512 = true := by decide +kernel
theorem ok_4096 : allOK 4096 512 = true := by decide +kernel
theorem ok_4608 : allOK 4608 512 = true := by decide +kernel
theorem ok_5120 : allOK 5120 512 = true := by decide +kernel
theorem ok_5632 : allOK 5632 512 = true := by decide +kernel
theorem ok_6144 : allOK 6144 512 = true := by decide +kernel
theorem ok_6656 : allOK 6656 512 = true := by decide +kernel
theorem ok_7168 : allOK 7168 512 = true := by decide +kernel
theorem ok_7680 : allOK 7680 512 = true := by decide +kernel
theorem ok_8192 : allOK 8192 512 = true := by decide +kernel
theorem ok_8704 : allOK 8704 512 = true := by decide +kernel
theorem ok_9216 : allOK 9216 512 = true := by decide +kernel
theorem ok_9728 : allOK 9728 512 = true := by decide +kernel
theorem ok_10240 : allOK 10240 512 = true := by decide +kernel
theorem ok_10752 : allOK 10752 512 = true := by decide +kernel
theorem ok_11264 : allOK 11264 512 = true := by decide +kernel
theorem ok_11776 : allOK 11776 512 = true := by decide +kernel
theorem ok_12288 : allOK 12288 512 = true := by decide +kernel
theorem ok_12800 : allOK 12800 512 = true := by decide +kernel
theorem ok_13312 : allOK 13312 512 = true := by decide +kernel
theorem ok_13824 : allOK 13824 512 = true := by decide +kernel
theorem ok_14336 : allOK 14336 512 = true := by decide +kernel
theorem ok_14848 : allOK 14848 512 = true := by decide +kernel
theorem ok_15360 : allOK 15360 512 = true := by decide +kernel
theorem ok_15872 : allOK 15872 512 = true := by decide +kernel
theorem ok_16384 : allOK 16384 512 = true := by decide +kernel
theorem ok_16896 : allOK 16896 512 = true := by decide +kernel
theorem ok_17408 : allOK 17408 512 = true := by decide +kernel
theorem ok_17920 : allOK 17920 512 = true := by decide +kernel
theorem ok_18432 : allOK 18432 512 = true := by decide +kernel
theorem ok_18944 : allOK 18944 512 = true := by decide +kernel
theorem ok_19456 : allOK 19456 512 = true := by decide +kernel
theorem ok_19968 : allOK 19968 512 = true := by decide +kernel
theorem ok_20480 : allOK 20480 512 = true := by decide +kernel
theorem ok_20992 : allOK 20992 512 = true := by decide +kernel
theorem ok_21504 : allOK 21504 512 = true := by decide +kernel
theorem ok_22016 : allOK 22016 512 = true := by decide +kernel
theorem ok_22528 : allOK 22528 512 = true := by decide +kernel
theorem ok_23040 : allOK 23040 512 = true := by decide +kernel
theorem ok_23552 : allOK 23552 512 = true := by decide +kernel
theorem ok_24064 : allOK 24064 512 = true := by decide +kernel
theorem ok_24576 : allOK 24576 512 = true := by decide +kernel
theorem ok_25088 : allOK 25088 512 = true := by decide +kernel
theorem ok_25600 : allOK 25600 512 = true := by decide +kernel
theorem ok_26112 : allOK 26112 512 = true := by decide +kernel
theorem ok_26624 : allOK 26624 512 = true := by decide +kernel
theorem ok_27136 : allOK 27136 512 = true := by decide +kernel
theorem ok_27648 : allOK 27648 512 = true := by decide +kernel
theorem ok_28160 : allOK 28160 512 = true := by decide +kernel
theorem ok_28672 : allOK 28672 512 = true := by decide +kernel
theorem ok_29184 : allOK 29184 512 = true := by decide +kernel
theorem ok_29696 : allOK 29696 512 = true := by decide +kernel
theorem ok_30208 : allOK 30208 512 = true := by decide +kernel
theorem ok_30720 : allOK 30720 512 = true := by decide +kernel
theorem ok_31232 : allOK 31232 512 = true := by decide +kernel
theorem ok_31744 : allOK 31744 512 = true := by decide +kernel
theorem ok_32256 : allOK 32256 512 = true := by decide +kernel
theorem ok_32768 : allOK 32768 512 = true := by decide +kernel
theorem ok_33280 : allOK 33280 512 = true := by decide +kernel
theorem ok_33792 : allOK 33792 512 = true := by decide +kernel
theorem ok_34304 : allOK 34304 512 = true := by decide +kernel
theorem ok_34816 : allOK 34816 512 = true := by decide +kernel
theorem ok_35328 : allOK 35328 512 = true := by decide +kernel
theorem ok_35840 : allOK 35840 512 = true := by decide +kernel
theorem ok_36352 : allOK 36352 512 = true := by decide +kernel
theorem ok_36864 : allOK 36864 512 = true := by decide +kernel
theorem ok_37376 : allOK 37376 512 = true := by decide +kernel
theorem ok_37888 : allOK 37888 512 = true := by decide +kernel
theorem ok_38400 : allOK 38400 512 = true := by decide +kernel
theorem ok_38912 : allOK 38912 512 = true := by decide +kernel
theorem ok_39424 : allOK 39424 512 = true := by decide +kernel
theorem ok_39936 : allOK 39936 512 = true := by decide +kernel
theorem ok_40448 : allOK 40448 512 = true := by decide +kernel
theorem ok_40960 : allOK 40960 512 = true := by decide +kernel
theorem ok_41472 : allOK 41472 512 = true := by decide +kernel
theorem ok_41984 : allOK 41984 512 = true := by decide +kernel
theorem ok_42496 : allOK 42496 512 = true := by decide +kernel
theorem ok_43008 : allOK 43008 512 = true := by decide +kernel
theorem ok_43520 : allOK 43520 512 = true := by decide +kernel
theorem ok_44032 : allOK 44032 512 = true := by decide +kernel
theorem ok_44544 : allOK 44544 512 = true := by decide +kernel
theorem ok_45056 : allOK 45056 512 = true := by decide +kernel
theorem ok_45568 : allOK 45568 512 = true := by decide +kernel
theorem ok_46080 : allOK 46080 512 = true := by decide +kernel
theorem ok_46592 : allOK 46592 512 = true := by decide +kernel
theorem ok_47104 : allOK 47104 512 = true := by decide +kernel
theorem ok_47616 : allOK 47616 512 = true := by decide +kernel
theorem ok_48128 : allOK 48128 512 = true := by decide +kernel
theorem ok_48640 : allOK 48640 512 = true := by decide +kernel
theorem ok_49152 : allOK 49152 512 = true := by decide +kernel
theorem ok_49664 : allOK 49664 512 = true := by decide +kernel
theorem ok_50176 : allOK 50176 512 = true := by decide +kernel
theorem ok_50688 : allOK 50688 512 = true := by decide +kernel
theorem ok_51200 : allOK 51200 512 = true := by decide +kernel
theorem ok_51712 : allOK 51712 512 = true := by decide +kernel
theorem ok_52224 : allOK 52224 512 = true := by decide +kernel
theorem ok_52736 : allOK 52736 512 = true := by decide +kernel
theorem ok_53248 : allOK 53248 512 = true := by decide +kernel
theorem ok_53760 : allOK 53760 512 = true := by decide +kernel
theorem ok_54272 : allOK 54272 512 = true := by decide +kernel
theorem ok_54784 : allOK 54784 512 = true := by decide +kernel
theorem ok_55296 : allOK 55296 512 = true := by decide +kernel
theorem ok_55808 : allOK 55808 512 = true := by decide +kernel
theorem ok_56320 : allOK 56320 512 = true := by decide +kernel
theorem ok_56832 : allOK 56832 512 = true := by decide +kernel
theorem ok_57344 : allOK 57344 512 = true := by decide +kernel
theorem ok_57856 : allOK 57856 512 = true := by decide +kernel
theorem ok_58368 : allOK 58368 512 = true := by decide +kernel
theorem ok_58880 : allOK 58880 512 = true := by decide +kernel
theorem okM0 : allOK 0 59392 = true := by
  have h0 : allOK 0 512 = true := ok_0
  have h1 : allOK 0 1024 = true := allOK_join 0 512 512 h0 ok_512
  have h2 : allOK 0 1536 = true := allOK_join 0 1024 512 h1 ok_1024
  have h3 : allOK 0 2048 = true := allOK_join 0 1536 512 h2 ok_1536
  have h4 : allOK 0 2560 = true := allOK_join 0 2048 512 h3 ok_2048
  have h5 : allOK 0 3072 = true := allOK_join 0 2560 512 h4 ok_2560
  have h6 : allOK 0 3584 = true := allOK_join 0 3072 512 h5 ok_3072
  have h7 : allOK 0 4096 = true := allOK_join 0 3584 512 h6 ok_3584
  have h8 : allOK 0 4608 = true := allOK_join 0 4096 512 h7 ok_4096
  have h9 : allOK 0 5120 = true := allOK_join 0 4608 512 h8 ok_4608
  have h10 : allOK 0 5632 = true := allOK_join 0 5120 512 h9 ok_5120
  have h11 : allOK 0 6144 = true := allOK_join 0 5632 512 h10 ok_5632
  have h12 : allOK 0 6656 = true := allOK_join 0 6144 512 h11 ok_6144
  have h13 : allOK 0 7168 = true := allOK_join 0 6656 512 h12 ok_6656
  have h14 : allOK 0 7680 = true := allOK_join 0 7168 512 h13 ok_7168
  have h15 : allOK 0 8192 = true := allOK_join 0 7680 512 h14 ok_7680
  have h16 : allOK 0 8704 = true := allOK_join 0 8192 512 h15 ok_8192
  have h17 : allOK 0 9216 = true := allOK_join 0 8704 512 h16 ok_8704
  have h18 : allOK 0 9728 = true := allOK_join 0 9216 512 h17 ok_9216
  have h19 : allOK 0 10240 = true := allOK_join 0 9728 512 h18 ok_9728
  have h20 : allOK 0 10752 = true := allOK_join 0 10240 512 h19 ok_10240
  have h21 : allOK 0 11264 = true := allOK_join 0 10752 512 h20 ok_10752
  have h22 : allOK 0 11776 = true := allOK_join 0 11264 512 h21 ok_11264
  have h23 : allOK 0 12288 = true := allOK_join 0 11776 512 h22 ok_11776
  have h24 : allOK 0 12800 = true := allOK_join 0 12288 512 h23 ok_12288
  have h25 : allOK 0 13312 = true := allOK_join 0 12800 512 h24 ok_12800
  have h26 : allOK 0 13824 = true := allOK_join 0 13312 512 h25 ok_13312
  have h27 : allOK 0 14336 = true := allOK_join 0 13824 512 h26 ok_13824
  have h28 : allOK 0 14848 = true := allOK_join 0 14336 512 h27 ok_14336
  have h29 : allOK 0 15360 = true := allOK_join 0 14848 512 h28 ok_14848
  have h30 : allOK 0 15872 = true := allOK_join 0 15360 512 h29 ok_15360
  have h31 : allOK 0 16384 = true := allOK_join 0 15872 512 h30 ok_15872
  have h32 : allOK 0 16896 = true := allOK_join 0 16384 512 h31 ok_16384
  have h33 : allOK 0 17408 = true := allOK_join 0 16896 512 h32 ok_16896
  have h34 : allOK 0 17920 = true := allOK_join 0 17408 512 h33 ok_17408
  have h35 : allOK 0 18432 = true := allOK_join 0 17920 512 h34 ok_17920
  have h36 : allOK 0 18944 = true := allOK_join 0 18432 512 h35 ok_18432
  have h37 : allOK 0 19456 = true := allOK_join 0 18944 512 h36 ok_18944
  have h38 : allOK 0 19968 = true := allOK_join 0 19456 512 h37 ok_19456
  have h39 : allOK 0 20480 = true := allOK_join 0 19968 512 h38 ok_19968
  have h40 : allOK 0 20992 = true := allOK_join 0 20480 512 h39 ok_20480
  have h41 : allOK 0 21504 = true := allOK_join 0 20992 512 h40 ok_20992
  have h42 : allOK 0 22016 = true := allOK_join 0 21504 512 h41 ok_21504
  have h43 : allOK 0 22528 = true := allOK_join 0 22016 512 h42 ok_22016
  have h44 : allOK 0 23040 = true := allOK_join 0 22528 512 h43 ok_22528
  have h45 : allOK 0 23552 = true := allOK_join 0 23040 512 h44 ok_23040
  have h46 : allOK 0 24064 = true := allOK_join 0 23552 512 h45 ok_23552
  have h47 : allOK 0 24576 = true := allOK_join 0 24064 512 h46 ok_24064
  have h48 : allOK 0 25088 = true := allOK_join 0 24576 512 h47 ok_24576
  have h49 : allOK 0 25600 = true := allOK_join 0 25088 512 h48 ok_25088
  have h50 : allOK 0 26112 = true := allOK_join 0 25600 512 h49 ok_25600
  have h51 : allOK 0 26624 = true := allOK_join 0 26112 512 h50 ok_26112
  have h52 : allOK 0 27136 = true := allOK_join 0 26624 512 h51 ok_26624
  have h53 : allOK 0 27648 = true := allOK_join 0 27136 512 h52 ok_27136
  have h54 : allOK 0 28160 = true := allOK_join 0 27648 512 h53 ok_27648
  have h55 : allOK 0 28672 = true := allOK_join 0 28160 512 h54 ok_28160
  have h56 : allOK 0 29184 = true := allOK_join 0 28672 512 h55 ok_28672
  have h57 : allOK 0 29696 = true := allOK_join 0 29184 512 h56 ok_29184
  have h58 : allOK 0 30208 = true := allOK_join 0 29696 512 h57 ok_29696
  have h59 : allOK 0 30720 = true := allOK_join 0 30208 512 h58 ok_30208
  have h60 : allOK 0 31232 = true := allOK_join 0 30720 512 h59 ok_30720
  have h61 : allOK 0 31744 = true := allOK_join 0 31232 512 h60 ok_31232
  have h62 : allOK 0 32256 = true := allOK_join 0 31744 512 h61 ok_31744
  have h63 : allOK 0 32768 = true := allOK_join 0 32256 512 h62 ok_32256
  have h64 : allOK 0 33280 = true := allOK_join 0 32768 512 h63 ok_32768
  have h65 : allOK 0 33792 = true := allOK_join 0 33280 512 h64 ok_33280
  have h66 : allOK 0 34304 = true := allOK_join 0 33792 512 h65 ok_33792
  have h67 : allOK 0 34816 = true := allOK_join 0 34304 512 h66 ok_34304
  have h68 : allOK 0 35328 = true := allOK_join 0 34816 512 h67 ok_34816
  have h69 : allOK 0 35840 = true := allOK_join 0 35328 512 h68 ok_35328
  have h70 : allOK 0 36352 = true := allOK_join 0 35840 512 h69 ok_35840
  have h71 : allOK 0 36864 = true := allOK_join 0 36352 512 h70 ok_36352
  have h72 : allOK 0 37376 = true := allOK_join 0 36864 512 h71 ok_36864
  have h73 : allOK 0 37888 = true := allOK_join 0 37376 512 h72 ok_37376
  have h74 : allOK 0 38400 = true := allOK_join 0 37888 512 h73 ok_37888
  have h75 : allOK 0 38912 = true := allOK_join 0 38400 512 h74 ok_38400
  have h76 : allOK 0 39424 = true := allOK_join 0 38912 512 h75 ok_38912
  have h77 : allOK 0 39936 = true := allOK_join 0 39424 512 h76 ok_39424
  have h78 : allOK 0 40448 = true := allOK_join 0 39936 512 h77 ok_39936
  have h79 : allOK 0 40960 = true := allOK_join 0 40448 512 h78 ok_40448
  have h80 : allOK 0 41472 = true := allOK_join 0 40960 512 h79 ok_40960
  have h81 : allOK 0 41984 = true := allOK_join 0 41472 512 h80 ok_41472
  have h82 : allOK 0 42496 = true := allOK_join 0 41984 512 h81 ok_41984
  have h83 : allOK 0 43008 = true := allOK_join 0 42496 512 h82 ok_42496
  have h84 : allOK 0 43520 = true := allOK_join 0 43008 512 h83 ok_43008
  have h85 : allOK 0 44032 = true := allOK_join 0 43520 512 h84 ok_43520
  have h86 : allOK 0 44544 = true := allOK_join 0 44032 512 h85 ok_44032
  have h87 : allOK 0 45056 = true := allOK_join 0 44544 512 h86 ok_44544
  have h88 : allOK 0 45568 = true := allOK_join 0 45056 512 h87 ok_45056
  have h89 : allOK 0 46080 = true := allOK_join 0 45568 512 h88 ok_45568
  have h90 : allOK 0 46592 = true := allOK_join 0 46080 512 h89 ok_46080
  have h91 : allOK 0 47104 = true := allOK_join 0 46592 512 h90 ok_46592
  have h92 : allOK 0 47616 = true := allOK_join 0 47104 512 h91 ok_47104
  have h93 : allOK 0 48128 = true := allOK_join 0 47616 512 h92 ok_47616
  have h94 : allOK 0 48640 = true := allOK_join 0 48128 512 h93 ok_48128
  have h95 : allOK 0 49152 = true := allOK_join 0 48640 512 h94 ok_48640
  have h96 : allOK 0 49664 = true := allOK_join 0 49152 512 h95 ok_49152
  have h97 : allOK 0 50176 = true := allOK_join 0 49664 512 h96 ok_49664
  have h98 : allOK 0 50688 = true := allOK_join 0 50176 512 h97 ok_50176
  have h99 : allOK 0 51200 = true := allOK_join 0 50688 512 h98 ok_50688
  have h100 : allOK 0 51712 = true := allOK_join 0 51200 512 h99 ok_51200
  have h101 : allOK 0 52224 = true := allOK_join 0 51712 512 h100 ok_51712
  have h102 : allOK 0 52736 = true := allOK_join 0 52224 512 h101 ok_52224
  have h103 : allOK 0 53248 = true := allOK_join 0 52736 512 h102 ok_52736
  have h104 : allOK 0 53760 = true := allOK_join 0 53248 512 h103 ok_53248
  have h105 : allOK 0 54272 = true := allOK_join 0 53760 512 h104 ok_53760
  have h106 : allOK 0 54784 = true := allOK_join 0 54272 512 h105 ok_54272
  have h107 : allOK 0 55296 = true := allOK_join 0 54784 512 h106 ok_54784
  have h108 : allOK 0 55808 = true := allOK_join 0 55296 512 h107 ok_55296
  have h109 : allOK 0 56320 = true := allOK_join 0 55808 512 h108 ok_55808
  have h110 : allOK 0 56832 = true := allOK_join 0 56320 512 h109 ok_56320
  have h111 : allOK 0 57344 = true := allOK_join 0 56832 512 h110 ok_56832
  have h112 : allOK 0 57856 = true := allOK_join 0 57344 512 h111 ok_57344
  have h113 : allOK 0 58368 = true := allOK_join 0 57856 512 h112 ok_57856
  have h114 : allOK 0 58880 = true := allOK_join 0 58368 512 h113 ok_58368
  have h115 : allOK 0 59392 = true := allOK_join 0 58880 512 h114 ok_58880
  exact h115
end RT.K3eD
