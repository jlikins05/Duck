Z = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
Z1 = [1,1,1];
Z2 = [1,1,1,1,1];
OldDuck = [.2,.4,.4,.2,.2,.2,0,-.2,-.2,-.7,-.5,-.4,-.4,-.4,-.2,0,0,0,.1,.15,.2,.2;.1,.1,.12,.12,.12,.3,.4,.3,0,0,-.25,-.4,-.8,-.4,-.45,-.4,-.8,-.4,-.35,-.27,-.2,.1;Z]
Oldwings = [-.2,-.4,-.2;-.3,-.2,-.2;Z1];
Oldeye = [0,0,.1,.1,0;.2,.25,.25,.2,.2;Z2];
Stand = [3.5,3.5,5,5;0,.75,.75,0]
X=0;
Y=.8;
P=0;
Tran = [1,0,X;0,1,Y;0,0,1]
Duck = Tran*OldDuck; wings = Tran*Oldwings; eye = Tran*Oldeye
myvideo = VideoWriter('Duck'); %create the video file; the file in

open(myvideo); % open it
plot(Duck(1,:),Duck(2,:),'b',wings(1,:),wings(2,:),'b',eye(1,:),eye(2,:),'b')
xlim([0, 5])
ylim([0, 5])

for i=1:110
    if i <=30 
        X = .1 + X;
        Tran= [1,0,X;0,1,Y;0,0,1];
        Duck = Tran*OldDuck; wings = Tran*Oldwings; eye = Tran*Oldeye;
        plot(Duck(1,:),Duck(2,:),'b',wings(1,:),wings(2,:),'b',eye(1,:),eye(2,:),'b',Stand(1,:),Stand(2,:),'c')
        xlim([0, 5])
        ylim([0, 5])
        pause(.1)
    elseif i>30 && i <=48
        Y = Y+.2;
        Tran= [1,0,X;0,1,Y;0,0,1];
        P = 10+P;
        Rota= [cosd(P),-sind(P),0;sind(P),cosd(P),0;0,0,1];
        Duck = Tran*Rota*OldDuck; wings = Tran*Rota*Oldwings; eye = Tran*Rota*Oldeye;
        plot(Duck(1,:),Duck(2,:),'b',wings(1,:),wings(2,:),'b',eye(1,:),eye(2,:),'b',Stand(1,:),Stand(2,:),'c')
        xlim([0, 5])
        ylim([0, 5])
        pause(.1)
   
    elseif i>48 && i <=66
        Y =  Y-.2;
        Tran= [1,0,X;0,1,Y;0,0,1];
        P = 10+P;
        Rota= [cosd(P),-sind(P),0;sind(P),cosd(P),0;0,0,1];
        Duck = Tran*Rota*OldDuck; wings = Tran*Rota*Oldwings; eye = Tran*Rota*Oldeye;
        plot(Duck(1,:),Duck(2,:),'b',wings(1,:),wings(2,:),'b',eye(1,:),eye(2,:),'b',Stand(1,:),Stand(2,:),'c')
        xlim([0, 5])
        ylim([0, 5])
        pause(.1)
    elseif i==67
        flip = [-1,0,0;0,1,0;0,0,1];
        Duck = Tran*Rota* flip*OldDuck; wings = Tran*Rota* flip*Oldwings; eye = Tran*Rota* flip*Oldeye;
        plot(Duck(1,:),Duck(2,:),'b',wings(1,:),wings(2,:),'b',eye(1,:),eye(2,:),'b',Stand(1,:),Stand(2,:),'c')
        xlim([0, 5])
        ylim([0, 5])
        pause(.1)
    elseif  i>68 && i <=110
        X = X-.1;
        Tran= [1,0,X;0,1,Y;0,0,1];
        Duck = Tran*Rota* flip*OldDuck; wings = Tran*Rota* flip*Oldwings; eye = Tran*Rota* flip*Oldeye;
        plot(Duck(1,:),Duck(2,:),'b',wings(1,:),wings(2,:),'b',eye(1,:),eye(2,:),'b',Stand(1,:),Stand(2,:),'c')
        xlim([0, 5])
        ylim([0, 5])
        pause(.1)
    end
    frame = getframe(gcf); %grab the frame from the current figure
    writeVideo(myvideo,frame); %write the frame to the video file
end
close(myvideo)


