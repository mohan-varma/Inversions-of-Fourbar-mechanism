clear all
clc
close all
[Pos,ang] = PosnAnlys_4barmech(1,2,3,2.5,[]);
% Output
% Pos = [O1xy Axy Bxy O2xy B'xy]
% ang = [angcrank angcoup angfollow angcoup' angfollow']
for ii = 1:101
figure(1)
   fourbar1x = Pos(ii,[1,3,5,7,1]);
   fourbar1y = Pos(ii,[2,4,6,8,2]);
   fourbar2x = Pos(ii,[1,3,9,7,1]);
   fourbar2y = Pos(ii,[2,4,10,8,2]);
   plot(fourbar1x,fourbar1y)
   hold on
   plot(fourbar1x,fourbar1y,'ro')
   plot(fourbar2x,fourbar2y)
   plot(fourbar2x,fourbar2y,'ro')
   axis([-5 5 -5 5])
   hold off
   grid on
end
%% Inversion I Link O1-A is fixed
figure(3)
ang1 = ang(1,1);
for ii = 1:101
   angi = ang(ii,1);
   delang = angi - ang1;
   TransMat = [cosd(delang) -sind(delang);sind(delang) cosd(delang)];
   PosI1(ii,1:2) = Pos(ii,1:2)*TransMat;
   PosI1(ii,3:4) = Pos(ii,3:4)*TransMat;
   PosI1(ii,5:6) = Pos(ii,5:6)*TransMat;
   PosI1(ii,7:8) = Pos(ii,7:8)*TransMat;
   PosI1(ii,9:10) = Pos(ii,9:10)*TransMat;
   angI1 = ang-delang;
   fourbar1x = PosI1(ii,[1,3,5,7,1]);
   fourbar1y = PosI1(ii,[2,4,6,8,2]);
   fourbar2x = PosI1(ii,[1,3,9,7,1]);
   fourbar2y = PosI1(ii,[2,4,10,8,2]);
   plot(fourbar1x,fourbar1y,'r')
   hold on
   plot(fourbar1x,fourbar1y,'ro')
   plot(fourbar2x,fourbar2y,'k--')
   plot(fourbar2x,fourbar2y,'ro')
   axis([-5 5 -5 5])
   hold off
   grid on
   pause(0.01)
end
%% Inversion 2 Link A-B is fixed
figure(5)
ang1 = ang(1,2);
Pos1 = Pos(1,3:4);
ang2 = ang(1,4);
for ii = 1:101
   ang1i = ang(ii,2);
   Pos1i = Pos(ii,3:4);
   delang1 = ang1i - ang1;
   delPos1 = Pos1i - Pos1;
   TransMat1 = [cosd(delang1) -sind(delang1);sind(delang1) cosd(delang1)];
  
   PosI2(ii,1:2) = Pos(ii,1:2)  - delPos1;
   PosI2(ii,3:4) = Pos(ii,3:4)  - delPos1;
   PosI2(ii,5:6) = Pos(ii,5:6)  - delPos1;
   PosI2(ii,7:8) = Pos(ii,7:8)  - delPos1;
   PosI2(ii,9:10) = Pos(ii,9:10)  - delPos1;
   PosI21(ii,1:2) = (PosI2(ii,1:2)-PosI2(ii,3:4))*TransMat1 + PosI2(ii,3:4);
   PosI21(ii,3:4) = (PosI2(ii,3:4)-PosI2(ii,3:4))*TransMat1 + PosI2(ii,3:4);
   PosI21(ii,5:6) = (PosI2(ii,5:6)-PosI2(ii,3:4))*TransMat1 + PosI2(ii,3:4);
   PosI21(ii,7:8) = (PosI2(ii,7:8)-PosI2(ii,3:4))*TransMat1 + PosI2(ii,3:4);
   angI2 = ang-delang1;
   ang2i = ang(ii,4);
   delang2 = ang2i - ang2;
   TransMat2 = [cosd(delang2) -sind(delang2);sind(delang2) cosd(delang2)];
  
   PosI22(ii,1:2) = (PosI2(ii,1:2)-PosI2(ii,3:4))*TransMat2 + PosI2(ii,3:4);
   PosI22(ii,3:4) = (PosI2(ii,3:4)-PosI2(ii,3:4))*TransMat2 + PosI2(ii,3:4);
   PosI22(ii,7:8) = (PosI2(ii,7:8)-PosI2(ii,3:4))*TransMat2 + PosI2(ii,3:4);
   PosI22(ii,9:10) = (PosI2(ii,9:10)-PosI2(ii,3:4))*TransMat2 + PosI2(ii,3:4);
   fourbar1x = PosI21(ii,[1,3,5,7,1]);
   fourbar1y = PosI21(ii,[2,4,6,8,2]);
   fourbar2x = PosI22(ii,[1,3,9,7,1]);
   fourbar2y = PosI22(ii,[2,4,10,8,2]);
   plot(fourbar1x,fourbar1y,'r-')
   hold on
   plot(fourbar1x,fourbar1y,'ro')
   plot(fourbar2x,fourbar2y,'k--')
   plot(fourbar2x,fourbar2y,'ro')
   axis([-5 5 -5 5])
   hold off
   grid on
   pause(0.01)
end
%% Inversion 3 Link O2-B is fixed
figure(7)
ang1 = ang(1,3);
Pos1 = Pos(1,7:8);
ang2 = ang(1,5);
for ii = 1:101
   ang1i = ang(ii,3);
   Pos1i = Pos(ii,7:8);
   delang1 = ang1i - ang1;
   delPos1 = Pos1i - Pos1;
   TransMat1 = [cosd(delang1) -sind(delang1);sind(delang1) cosd(delang1)];
  
   PosI3(ii,1:2) = Pos(ii,1:2)  - delPos1;
   PosI3(ii,3:4) = Pos(ii,3:4)  - delPos1;
   PosI3(ii,5:6) = Pos(ii,5:6)  - delPos1;
   PosI3(ii,7:8) = Pos(ii,7:8)  - delPos1;
   PosI3(ii,9:10) = Pos(ii,9:10)  - delPos1;
   PosI31(ii,1:2) = (PosI3(ii,1:2)-PosI3(ii,7:8))*TransMat1 + PosI3(ii,7:8);
   PosI31(ii,3:4) = (PosI3(ii,3:4)-PosI3(ii,7:8))*TransMat1 + PosI3(ii,7:8);
   PosI31(ii,5:6) = (PosI3(ii,5:6)-PosI3(ii,7:8))*TransMat1 + PosI3(ii,7:8);
   PosI31(ii,7:8) = (PosI3(ii,7:8)-PosI3(ii,7:8))*TransMat1 + PosI3(ii,7:8);
   angI2 = ang-delang1;
   ang2i = ang(ii,5);
   delang2 = ang2i - ang2;
   TransMat2 = [cosd(delang2) -sind(delang2);sind(delang2) cosd(delang2)];
  
   PosI32(ii,1:2) = (PosI3(ii,1:2)-PosI3(ii,7:8))*TransMat2 + PosI3(ii,7:8);
   PosI32(ii,3:4) = (PosI3(ii,3:4)-PosI3(ii,7:8))*TransMat2 + PosI3(ii,7:8);
   PosI32(ii,7:8) = (PosI3(ii,7:8)-PosI3(ii,7:8))*TransMat2 + PosI3(ii,7:8);
   PosI32(ii,9:10) = (PosI3(ii,9:10)-PosI3(ii,7:8))*TransMat2 + PosI3(ii,7:8);
   fourbar1x = PosI31(ii,[1,3,5,7,1]);
   fourbar1y = PosI31(ii,[2,4,6,8,2]);
   fourbar2x = PosI32(ii,[1,3,9,7,1]);
   fourbar2y = PosI32(ii,[2,4,10,8,2]);
   plot(fourbar1x,fourbar1y,'r-')
   hold on
   plot(fourbar1x,fourbar1y,'ro')
   plot(fourbar2x,fourbar2y,'k--')
   plot(fourbar2x,fourbar2y,'ro')
   axis([-5 5 -5 5])
   hold off
   grid on
   pause(0.01)
end
