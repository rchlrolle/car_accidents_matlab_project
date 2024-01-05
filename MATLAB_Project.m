%% MATLAB Project_Rolle

%% INTRODUCTION
disp('You live in the heart of California....') 
pause(2)
disp("Which is known for it's traffic and potential accidents..")
pause(2)
disp("You have a fear of getting into a car crash..")
pause(2)
disp('This program will inform you on which factors increase your likeihood of getting into an accident.') 
pause(2)
disp('Enjoy ;)')
pause (10)

%% TABLES & Graphs: General Info
clear;clc
data_table %Made Function
pause(20)
%Age
clear;clc
load('traffic-crashes.mat');
A=trafficcrashes1;
age= A(:,21);
A1=table2array(age);
subplot(2,2,1)
histogram(A1,6),title('Age of Driver')
%Road_Cond
A2=A(:,41);
aa2=table2array(A2);
Road_Cond=categorical(aa2);
summary(Road_Cond);
subplot(2,2,2)
histogram(Road_Cond), title('Road Condition')
%Weather
A4= A(:,12);
aa4=table2array(A4);
weather=categorical(aa4);
subplot(2,2,3)
histogram(weather), title('Weather Condition')
%Sun
A5= A(:,42);
aa5=table2array(A5);
sun=categorical(aa5);
subplot(2,2,4)
histogram(sun), title('Light')
hold off
pause(20)

%Distance
figure(2)
distance= A(:,9); %12720 rows(accidents)
A6=table2array(distance);
x=1:12720;
y=A6;
plot(x,y,x,mean(A6),'ko');title('Distance of Accident');ylabel('Distance(m)');
text(6000,1000,'Average= 247.44')
hold off
%Table of Distance
pause(10)
b=mode(A6);c=mean(A6);d=min(A6);e=max(A6);
disp('Description of Length(m) of All Accidents Reported')
disp('     Mode       Mean          Min        Max')
disp({b,c,d,e})
pause(5)


%% Continue: Logical Function
disp('This information may be overwhelming...')
pause(3)
play=input("Would you like the data to be tailored to you? '1' for yes or '0' for no? \n");
while play<1 %%Loop
    if play==1
        break
    elseif play==0
        msg='End of Program Exit Now'
       assert(error(msg))
    end
end
%% Information tailored to them..(Menus)
% Age Menu
clear;clc
load('traffic-crashes.mat');
A=trafficcrashes1;
age= A(:,21);
A1=table2array(age);
young_adult=100-length(find(A1<18 | A1>29))/length(A1)*100;
middle_age=100-length(find(A1<30 | A1>45))/length(A1)*100;
middle_age2=100-length(find(A1<46 | A1>59))/length(A1)*100;
old_adult=100-length(find(A1<60 | A1>100))/length(A1)*100;
age_group={young_adult middle_age middle_age2 old_adult};
age1=menu('How old are you?','18-29','20-45','46-59','60-100');
disp('This is percentage is how likely you are to get into an accident:')
disp(age_group(age1))









%% Function table
function data_table(data)
clear;clc
load('traffic-crashes.mat')
data=trafficcrashes1;
data.Properties.VariableNames{'V1_Driver_'}='Age';
data.Properties.VariableNames{'V1_Type'}='Vehicle_Type';
data.Properties.VariableNames{'Factors_Ro'}='Road_Cond';
data.Properties.VariableNames{'Distance'}='Length_of_Hazard_Area';
rows=data(:,[9 21 41 19 42 12])%Display Info in Table

return
end


