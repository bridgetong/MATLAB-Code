%% �ṹ����ѧ��ҵ(�������Э�񶯣�PPT�ϵ�����
clear
clc
% 1 ��̬��
w=83.78;%����Ƶ��
l=0.2;%�����
p=30;%����ط�ֵ
k=1314.5*10^3;%�ն�
wn=91.79;%����Ƶ��
b=w/wn;%Ƶ�ʱ�
f=-atan((2*l*b)/(1-b^2));%��λ��
yst=p/k;%��λ��
Rd=1/sqrt((1-b^2)^2+(2*l*b)^2);%�����Ŵ�ϵ��
interval_t=2*pi/w/50;%ʱ����
t=0:interval_t:10;
A=yst.*Rd*sin(w.*t-f).*1000;%��̬����ؽ�
% 2 ˲̬��(�����������񶯣�
y0=0.01;v0=0;%��ʼ����
wd=wn.*sqrt(1-l^2);
C1=(v0+l.*wn.*y0)/wd;
C2=y0;
interval_t1=2.*pi/wd/50
t1=0:interval_t1:10;
y=(exp(-l.*w.*t1)).*(C1.*sin(wd.*t1)+C2.*cos(wd.*t1))*1000;
% 3 ��ͼ
hold on
plot(t,A);
xlabel('t/s')
ylabel('u/mm')
plot(t1,y,':');
legend('��̬��Ӧ','˲̬��Ӧ');
hold off
