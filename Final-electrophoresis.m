%Francisco Nicolas Jervis

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Grid y puntos
N=11;
n=(N-1)/2;
x=-n:.4:n;
y=-n:.4:n;
[X,Y]=meshgrid(x,y);
np=201;                     %numero puntos totales
Q=1;
Qp=Q;
Qn=Q*-1;
Xp=-3:0.03:3;
Xn=-1:0.01:1;
Yn=2.5;
Yp=-2.5;


%Constantes
e0 = 8.854e-12;
k = 1/(4*pi*e0);

%Inicio variables
E=zeros(26,26);
Ex=E;
Ey=E;
r=E;
 

%Campo electrico positivo
for i = 1:np
    r=sqrt((X-Xp(i)).^2+(Y-Yp).^2);
    Ex = Ex + k.*Qp.*(X-Xp(i))./r.^3;      
    Ey = Ey + k.*Qp.*(Y-Yp)./r.^3;      
end
%Campo electrico negativo
for i = 1:np
    r=sqrt((X-Xn(i)).^2+(Y-Yn).^2);
    Ex = Ex + k.*Qn.*(X-Xn(i))./r.^3;      
    Ey = Ey + k.*Qn.*(Y-Yn)./r.^3;      
end

E=sqrt(Ex.^2+Ey.^2);      
cx=Ex./E;
cy=Ey./E;
%Plot
figure(1);
quiver(x,y,cx,cy,0.7)
axis([-5 5 -5 5])
axis square;
box on;
hold on;
%Limites
lpos=rectangle('position',[-5 -2.55 10 .1]);
set(lpos,'Facecolor','k');
lneg=rectangle('position',[-5 2.45 10 .1]);
set(lneg,'Facecolor','k');

%Particulas negativas
particulan=rectangle('Position',[-1 2.25 2 .5],'curvature',0.2);
set(particulan,'Facecolor','b','Edgecolor','k');


%Particulas positivas

particulap=rectangle('Position',[-3 -2.75 6 .5],'curvature',0.2);
set(particulap,'Facecolor','r','Edgecolor','k');

%celulas
num_celulas=150;
ycel=zeros(1,num_celulas);
xcel=ycel-5;
celz=ycel; 
t=0;
for i=1:num_celulas
    ycel(i)=-1+(1+1)*rand;
end
while t<300
    for i=1:num_celulas/3
        celz(i)=plot(xcel(i),ycel(i),"Marker","o",'MarkerFaceColor','y');

        if xcel(i)>5
            xcel(i)=-5;
            ycel(i)=-1+(1+1)*rand;
        else
            xcel(i)=xcel(i)+rand;
        end

        if ycel(i)>2.5
            ycel(i)=2.5;
        else
            ycel(i)=ycel(i)+0.25;
        end
    end

    for i=num_celulas/3+1:num_celulas
        celz(i)=plot(xcel(i),ycel(i),"Marker","o",'MarkerFaceColor','k');

        if xcel(i)>5
            xcel(i)=-5;
            ycel(i)=-1+(1+1)*rand;
        else
            xcel(i)=xcel(i)+0.7*rand;
        end

        if ycel(i)<-2.5
            ycel(i)=-2.5;
        else
            ycel(i)=ycel(i)-0.17;
        end
    end

    pause(0.05)
    for i=1:num_celulas
        delete(celz(i))
    end
    t=t+1;
end