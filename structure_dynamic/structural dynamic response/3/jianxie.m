%% �ṹ����ѧ3-7��г�����µ���Ӧ
%�Ź�÷���ֺ͸���Ҷ�任��ֻ������̬�⣬�������������ʼ�������ٶȺ�λ��Ϊ�㣬���ٶȿɲ�Ϊ�㣩�ɶ������˲̬��,����γ������⡣��ֵ����ֱ����������⡣
clear
clc
[t,y_du]=Duhamelintegralfor37(10,0.005);% solution in time domain
[t_3,y_fre]=fre_methodfor37(10,0.005);%fft and ifft

%����������ɼ���������İ�����Ƶ���񶯵ķ�������Ϊ���������񶯣�����ʱ��ܿ�˥����
 hold on
plot(t,y_du,':go');
hold on
plot(t_3,real(y_fre),'-.rp')
legend('Duhamel-interal','Frequency-domain-method');
hold off
xlabel('t/s');
ylabel('λ��/m');
%%remark
%���ַ��������˰��������񶯣��Ź�÷���ֵķ�������ֵ����

function [t,y_du] = Duhamelintegralfor37(aa,bb)
%inputting paremeters.
% aa=10;up bound of time
%bb=0.02;% time interval
%%%%%
t=bb:bb:aa;
t1=t;% time series
%%%%%
theta=10*pi;%the frequency of loads (radian/s)
w=104.5;% natural frequency of vibration (radian/s)
kesi=0.01;%damping ratio
w_d=w*(1-kesi^2)^0.5;% natural frequency of damping system
m=545;% mass (kg)
p0=267;%amplitude of loads (N)
%%%%
%p=0.1.*t.*(t<=5)+0.*(t>5);% the series of amplitude
%%%%% 
p=p0.*sin(theta*t);%function of loads
 
%%%%%%%%the main program
for i=1:(aa/bb)
    for j=1:i
        %paramet1(j)=p(j)/(m*w)*bb*sin(w*(t(i)-t1(j)));%Duhameil's integral function for non-damping system
        paramet2(j)=p(j)/(m*w_d)*bb*exp(-kesi*w*(t(i)-t1(j)))*sin(w_d*(t(i)-t1(j)));%%Duhameil's integral function for damping system
    end
    y_du(i)=sum(paramet2);%%displacement 
   
end

end



function [t_3,y_fre] = fre_methodfor37(t_p,diata_t )
% t_p=10;
% diata_t=0.01;
nn=0:1:t_p/diata_t-1;
t_3=nn*diata_t;
N=t_p/diata_t;
w=10*pi;%the unit is radian/second load
p_0=267;
p_t=p_0*sin(w*t_3);
p_f=fft(p_t,N);%fft�任�����������Ƶ�ʵ��������ݣ�����Ƶ�ʷֱ�洢�ڽ����ǰ��벿�֣�matlab�����ź��е�Ӧ��һ�����н���
p_ff=[p_f(N/2+1:end),p_f(1:N/2)];%after fft transform���ĳɸ�����Ƶ�ʶ�Ӧ�ķ�ֵ
f=(-N/2:1:N/2-1)/(N*diata_t);%Ƶ���Ǵ�-N/2 ����N/2��
%plot(f(1:N/2),abs(y(1:N/2))*2/N)
k=5951.11111*10^3;%the standard unit
w_n=104.5;%the unit is radian/second natrual vibration
kesai=0.01;
beita=2*f*pi/w_n;
fre_res=(1/k)*((1-beita.^2)+i*2*kesai*beita).^-1;%Ƶ�캯��Ҳ�Ǹ���Ƶ�ʶ�Ӧ��ֵ
y_f=p_ff.*fre_res;%��Ӧ�ķ�ֵ
y_ff=[y_f(N/2+1:end),y_f(1:N/2)];%����Ƶ�ʶ�Ӧ����Ӧ�ķ�ֵ
y_fre=ifft(y_ff,N);%��FFT�任

end
