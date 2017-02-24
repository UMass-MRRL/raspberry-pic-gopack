  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (gtzxtek1twl)
    ;%
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% gtzxtek1twl.PIDController_D
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% gtzxtek1twl.PIDController_I
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% gtzxtek1twl.DiscreteDerivative_ICPrevScaled
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% gtzxtek1twl.DiscreteDerivative1_ICPrevScale
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% gtzxtek1twl.PIDController_LowerSaturationLi
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% gtzxtek1twl.PIDController_N
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% gtzxtek1twl.PIDController_P
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% gtzxtek1twl.PIDController_UpperSaturationLi
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% gtzxtek1twl.DiscreteDerivative2_ICPrevScale
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 39;
      section.data(39)  = dumData; %prealloc
      
	  ;% gtzxtek1twl.Delay_InitialCondition
	  section.data(1).logicalSrcIdx = 9;
	  section.data(1).dtTransOffset = 0;
	
	  ;% gtzxtek1twl.Integrator_gainval
	  section.data(2).logicalSrcIdx = 10;
	  section.data(2).dtTransOffset = 1;
	
	  ;% gtzxtek1twl.Integrator_IC
	  section.data(3).logicalSrcIdx = 11;
	  section.data(3).dtTransOffset = 2;
	
	  ;% gtzxtek1twl.Filter_gainval
	  section.data(4).logicalSrcIdx = 12;
	  section.data(4).dtTransOffset = 3;
	
	  ;% gtzxtek1twl.Filter_IC
	  section.data(5).logicalSrcIdx = 13;
	  section.data(5).dtTransOffset = 4;
	
	  ;% gtzxtek1twl.LSBtoV_Gain
	  section.data(6).logicalSrcIdx = 14;
	  section.data(6).dtTransOffset = 5;
	
	  ;% gtzxtek1twl.MomentSensorOffset_Value
	  section.data(7).logicalSrcIdx = 15;
	  section.data(7).dtTransOffset = 6;
	
	  ;% gtzxtek1twl.MomentSensorGainNmV_Gain
	  section.data(8).logicalSrcIdx = 16;
	  section.data(8).dtTransOffset = 7;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter_InitialStates
	  section.data(9).logicalSrcIdx = 17;
	  section.data(9).dtTransOffset = 8;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter_Coefficients
	  section.data(10).logicalSrcIdx = 18;
	  section.data(10).dtTransOffset = 9;
	
	  ;% gtzxtek1twl.MomentDeadZone_Start
	  section.data(11).logicalSrcIdx = 19;
	  section.data(11).dtTransOffset = 19;
	
	  ;% gtzxtek1twl.MomentDeadZone_End
	  section.data(12).logicalSrcIdx = 20;
	  section.data(12).dtTransOffset = 20;
	
	  ;% gtzxtek1twl.DesiredMotorPosbs_extension_Amp
	  section.data(13).logicalSrcIdx = 21;
	  section.data(13).dtTransOffset = 21;
	
	  ;% gtzxtek1twl.DesiredMotorPosbs_extension_Fre
	  section.data(14).logicalSrcIdx = 22;
	  section.data(14).dtTransOffset = 22;
	
	  ;% gtzxtek1twl.Constant1_Value
	  section.data(15).logicalSrcIdx = 23;
	  section.data(15).dtTransOffset = 23;
	
	  ;% gtzxtek1twl.ExtensionConversion_Gain
	  section.data(16).logicalSrcIdx = 24;
	  section.data(16).dtTransOffset = 24;
	
	  ;% gtzxtek1twl.RPMConversion_Gain
	  section.data(17).logicalSrcIdx = 25;
	  section.data(17).dtTransOffset = 25;
	
	  ;% gtzxtek1twl.TSamp_WtEt
	  section.data(18).logicalSrcIdx = 26;
	  section.data(18).dtTransOffset = 26;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter6_InitialState
	  section.data(19).logicalSrcIdx = 27;
	  section.data(19).dtTransOffset = 27;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter6_Coefficients
	  section.data(20).logicalSrcIdx = 28;
	  section.data(20).dtTransOffset = 28;
	
	  ;% gtzxtek1twl.BipolarVoffset_Value
	  section.data(21).logicalSrcIdx = 29;
	  section.data(21).dtTransOffset = 38;
	
	  ;% gtzxtek1twl.ActualCurrentGainAV_Gain
	  section.data(22).logicalSrcIdx = 30;
	  section.data(22).dtTransOffset = 39;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter2_InitialState
	  section.data(23).logicalSrcIdx = 31;
	  section.data(23).dtTransOffset = 40;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter2_Coefficients
	  section.data(24).logicalSrcIdx = 32;
	  section.data(24).dtTransOffset = 41;
	
	  ;% gtzxtek1twl.thetaz_dOffset_Value
	  section.data(25).logicalSrcIdx = 33;
	  section.data(25).dtTransOffset = 51;
	
	  ;% gtzxtek1twl.degs_Gain
	  section.data(26).logicalSrcIdx = 34;
	  section.data(26).dtTransOffset = 52;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter3_InitialState
	  section.data(27).logicalSrcIdx = 35;
	  section.data(27).dtTransOffset = 53;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter3_Coefficients
	  section.data(28).logicalSrcIdx = 36;
	  section.data(28).dtTransOffset = 54;
	
	  ;% gtzxtek1twl.TSamp_WtEt_esjgsdqjww
	  section.data(29).logicalSrcIdx = 37;
	  section.data(29).dtTransOffset = 64;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter1_InitialState
	  section.data(30).logicalSrcIdx = 38;
	  section.data(30).dtTransOffset = 65;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter1_Coefficients
	  section.data(31).logicalSrcIdx = 39;
	  section.data(31).dtTransOffset = 66;
	
	  ;% gtzxtek1twl.x_ddOffset_Value
	  section.data(32).logicalSrcIdx = 40;
	  section.data(32).dtTransOffset = 76;
	
	  ;% gtzxtek1twl.xgs_Gain
	  section.data(33).logicalSrcIdx = 41;
	  section.data(33).dtTransOffset = 77;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter4_InitialState
	  section.data(34).logicalSrcIdx = 42;
	  section.data(34).dtTransOffset = 78;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter4_Coefficients
	  section.data(35).logicalSrcIdx = 43;
	  section.data(35).dtTransOffset = 79;
	
	  ;% gtzxtek1twl.y_ddOffset_Value
	  section.data(36).logicalSrcIdx = 44;
	  section.data(36).dtTransOffset = 89;
	
	  ;% gtzxtek1twl.ygs_Gain
	  section.data(37).logicalSrcIdx = 45;
	  section.data(37).dtTransOffset = 90;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter5_InitialState
	  section.data(38).logicalSrcIdx = 46;
	  section.data(38).dtTransOffset = 91;
	
	  ;% gtzxtek1twl.DiscreteFIRFilter5_Coefficients
	  section.data(39).logicalSrcIdx = 47;
	  section.data(39).dtTransOffset = 92;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% gtzxtek1twl.Delay_DelayLength
	  section.data(1).logicalSrcIdx = 48;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% gtzxtek1twl.LSBtoV3_Gain
	  section.data(1).logicalSrcIdx = 49;
	  section.data(1).dtTransOffset = 0;
	
	  ;% gtzxtek1twl.LSBtoV1_Gain
	  section.data(2).logicalSrcIdx = 50;
	  section.data(2).dtTransOffset = 1;
	
	  ;% gtzxtek1twl.LSBtoV2_Gain
	  section.data(3).logicalSrcIdx = 51;
	  section.data(3).dtTransOffset = 2;
	
	  ;% gtzxtek1twl.LSBtoV4_Gain
	  section.data(4).logicalSrcIdx = 52;
	  section.data(4).dtTransOffset = 3;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (mun12cfoeah)
    ;%
      section.nData     = 27;
      section.data(27)  = dumData; %prealloc
      
	  ;% mun12cfoeah.dusf3knbat
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% mun12cfoeah.dsxdbcr0sl
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% mun12cfoeah.b5eal5e4sj
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% mun12cfoeah.j422qzmelf
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% mun12cfoeah.l22denshgm
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% mun12cfoeah.monwzvg2fy
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 8;
	
	  ;% mun12cfoeah.kxuhswyj0s
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 9;
	
	  ;% mun12cfoeah.k54j2x2kca
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 10;
	
	  ;% mun12cfoeah.lqnihbi2ti
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 11;
	
	  ;% mun12cfoeah.fs0p21kjid
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 12;
	
	  ;% mun12cfoeah.jmfsk033tz
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 13;
	
	  ;% mun12cfoeah.cokmrn3xrv
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 14;
	
	  ;% mun12cfoeah.ahtizfooav
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 15;
	
	  ;% mun12cfoeah.lyii1lfayt
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 16;
	
	  ;% mun12cfoeah.aecvhmkp2h
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 17;
	
	  ;% mun12cfoeah.mivs5amv0j
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 18;
	
	  ;% mun12cfoeah.f25auwdi0x
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 19;
	
	  ;% mun12cfoeah.a33hvnfvmx
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 20;
	
	  ;% mun12cfoeah.nbvipemw4v
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 21;
	
	  ;% mun12cfoeah.kyi1a0hbth
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 22;
	
	  ;% mun12cfoeah.flxdgpclsl
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 23;
	
	  ;% mun12cfoeah.mdv4shx1wo
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 24;
	
	  ;% mun12cfoeah.pp3fvvv2m5
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 25;
	
	  ;% mun12cfoeah.gtw12l4mq5
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 26;
	
	  ;% mun12cfoeah.ls5h0gmora
	  section.data(25).logicalSrcIdx = 24;
	  section.data(25).dtTransOffset = 27;
	
	  ;% mun12cfoeah.m1lmxqvgxn
	  section.data(26).logicalSrcIdx = 25;
	  section.data(26).dtTransOffset = 28;
	
	  ;% mun12cfoeah.gzigoiijx2
	  section.data(27).logicalSrcIdx = 26;
	  section.data(27).dtTransOffset = 29;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% mun12cfoeah.lw0apv14wl
	  section.data(1).logicalSrcIdx = 27;
	  section.data(1).dtTransOffset = 0;
	
	  ;% mun12cfoeah.ljn4dcxvd2
	  section.data(2).logicalSrcIdx = 28;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% mun12cfoeah.ow50himaor
	  section.data(1).logicalSrcIdx = 29;
	  section.data(1).dtTransOffset = 0;
	
	  ;% mun12cfoeah.dnh12fkx4m
	  section.data(2).logicalSrcIdx = 30;
	  section.data(2).dtTransOffset = 1;
	
	  ;% mun12cfoeah.ddw3eb51t0
	  section.data(3).logicalSrcIdx = 31;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(3) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% mun12cfoeah.ev51podyfk
	  section.data(1).logicalSrcIdx = 32;
	  section.data(1).dtTransOffset = 0;
	
	  ;% mun12cfoeah.notwzjjoqx
	  section.data(2).logicalSrcIdx = 33;
	  section.data(2).dtTransOffset = 4;
	
	  ;% mun12cfoeah.mvxuy55hx4
	  section.data(3).logicalSrcIdx = 34;
	  section.data(3).dtTransOffset = 8;
	
	  ;% mun12cfoeah.cr4v4oojr4
	  section.data(4).logicalSrcIdx = 35;
	  section.data(4).dtTransOffset = 12;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(4) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% mun12cfoeah.grsq45a5c3
	  section.data(1).logicalSrcIdx = 36;
	  section.data(1).dtTransOffset = 0;
	
	  ;% mun12cfoeah.a4fy3xq2ve
	  section.data(2).logicalSrcIdx = 37;
	  section.data(2).dtTransOffset = 54;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 3;
    sectIdxOffset = 5;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (pk10til11ga)
    ;%
      section.nData     = 15;
      section.data(15)  = dumData; %prealloc
      
	  ;% pk10til11ga.erf2rejzin
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% pk10til11ga.el3bdge0lf
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% pk10til11ga.ka5tporrlg
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% pk10til11ga.ny1nfr3jqc
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% pk10til11ga.krbd5vtwpt
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% pk10til11ga.exidfbsmd1
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% pk10til11ga.k4mgpc3m42
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% pk10til11ga.ergqkmvbs5
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 15;
	
	  ;% pk10til11ga.d4eldzigtd
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 16;
	
	  ;% pk10til11ga.o0ketq0sci
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 25;
	
	  ;% pk10til11ga.i52ms0qw3w
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 34;
	
	  ;% pk10til11ga.jhtcl3jpuz
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 43;
	
	  ;% pk10til11ga.ldn3i45qzg
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 44;
	
	  ;% pk10til11ga.gj2w0w4mao
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 53;
	
	  ;% pk10til11ga.i3rmnrmnsy
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 62;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% pk10til11ga.l4sani0p2s.LoggedData
	  section.data(1).logicalSrcIdx = 16;
	  section.data(1).dtTransOffset = 0;
	
	  ;% pk10til11ga.arwe2q2xvz.LoggedData
	  section.data(2).logicalSrcIdx = 17;
	  section.data(2).dtTransOffset = 3;
	
	  ;% pk10til11ga.ofrohymegm.LoggedData
	  section.data(3).logicalSrcIdx = 18;
	  section.data(3).dtTransOffset = 5;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% pk10til11ga.cklty2sqbs
	  section.data(1).logicalSrcIdx = 19;
	  section.data(1).dtTransOffset = 0;
	
	  ;% pk10til11ga.nkb5rvbxbp
	  section.data(2).logicalSrcIdx = 20;
	  section.data(2).dtTransOffset = 1;
	
	  ;% pk10til11ga.gio3qega24
	  section.data(3).logicalSrcIdx = 21;
	  section.data(3).dtTransOffset = 2;
	
	  ;% pk10til11ga.izrxc3nkeb
	  section.data(4).logicalSrcIdx = 22;
	  section.data(4).dtTransOffset = 3;
	
	  ;% pk10til11ga.l1kk1v20dk
	  section.data(5).logicalSrcIdx = 23;
	  section.data(5).dtTransOffset = 4;
	
	  ;% pk10til11ga.d15gya33iw
	  section.data(6).logicalSrcIdx = 24;
	  section.data(6).dtTransOffset = 5;
	
	  ;% pk10til11ga.byhuqewzkg
	  section.data(7).logicalSrcIdx = 25;
	  section.data(7).dtTransOffset = 6;
	
	  ;% pk10til11ga.hkqdivxa4t
	  section.data(8).logicalSrcIdx = 26;
	  section.data(8).dtTransOffset = 7;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 2883786202;
  targMap.checksum1 = 978562551;
  targMap.checksum2 = 1902844648;
  targMap.checksum3 = 1917582929;

