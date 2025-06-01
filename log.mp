prologues := 3;
%outputtemplate := "%j-%c.eps";

input TEX;

randomseed := 2006.0908;

defaultscale := 1.2;

verbatimtex
\magnification=1200
etex

color gridmm; gridmm=5/8[blue, white];
color gridcm; gridcm=3/8[blue, white];

beginfig(1);
numeric b; b = 2.7182818;
numeric ux, uy;
ux=uy=1cm;

pickup pencircle scaled 0.2pt;
for i = -20 upto 30:
	%if (i mod 10) <> 0: draw (0, i/10*uy) -- (10ux, i/10*uy) withcolor gridmm fi;
endfor;
for i = 1 upto 100:
	%if (i mod 10) <> 0: draw (i/10*ux, -2uy)--(i/10*ux, 3uy) withcolor gridmm fi;
endfor;

for i = -2 upto 3:
	if i <> 0: draw (0, i*uy) -- (10ux, i*uy) withcolor gridcm fi;
endfor;
for i = 1 upto 10:
	draw (i*ux, -2uy)--(i*ux, 3uy) withcolor gridcm;
endfor;

pickup pencircle scaled 0.4pt;
drawarrow (0, 0) -- (10ux+5mm, 0);
drawarrow (0, -2uy)--(0, 3uy+5mm); 

pickup pencircle scaled 0.3mm;
draw (0.1ux, mlog(0.1)*uy/256) {0.1ux, uy}
for ix=2 upto 103:
	.. (ix*ux/10, mlog(ix/10)*uy/256) {ix * ux,10uy}
endfor
withcolor red;

for i = 0 upto 10:
	label.bot(TEX("$\mathstrut" & decimal i & "$"), (i*ux,-2uy));
endfor;
for i = -2 upto 3:
	label.lft(TEX("$" & decimal i & "$"), (0,i*uy));
endfor;

pickup pencircle scaled 0.4pt;
numeric u, v;
u = b*ux; v = mlog(b)*uy/256;
draw (u,0) -- (u,v) dashed evenly;
dotlabel("", (u,v));
dotlabel.bot(btex $\mathstrut b$ etex, (u,0));

numeric u, v;
u = 2b*ux; v = mlog(2b)*uy/256;
draw (u,0) -- (u,v) dashed evenly;
dotlabel("", (u,v));
dotlabel.bot(btex $\mathstrut 2b$ etex, (u,0));

numeric u, v;
u = b*b*ux; v = mlog(b*b)*uy/256;
draw (u,0) -- (u,v) dashed evenly;
dotlabel("", (u,v));
dotlabel.bot(btex $\mathstrut b^2$ etex, (u,0));

numeric u, v;
u = ux/b; v = -mlog(b)*uy/256;
draw (u,0) -- (u,v) dashed evenly;
dotlabel("", (u,v));
dotlabel.top(btex $\displaystyle{1\over b}$ etex, (u,0));

dotlabel("", (1ux,0));
label.rt(btex $x$ etex, (10ux+5mm, 0));
label.top(btex $y$ etex, (0, 3uy+5mm));

endfig;

beginfig(2);
numeric p; p=2.5;
numeric q; q=0.5;

numeric u; u=1cm;
numeric o; o=5mm;
z0=(p*p-q*q, 2*p*q) * u; 
z1 = (x0+o, 0);
z2 = (0, y0+o);

pickup pencircle scaled 0.4pt;
drawarrow (-2mm, 0) -- z1;
drawarrow (0, -2mm) -- z2; 

draw z0 -- (x0,0) dashed evenly;
draw z0 -- (0,y0) dashed evenly;

pickup pencircle scaled 0.3mm;
drawarrow origin -- z0  withcolor red;

z4 = (p,q) * u;
z5 = (x4,0) rotated angle z0;

pickup pencircle scaled 0.4pt;
drawarrow 3/4(x4,0){up}..3/4z5{z0 rotated 90};

label.rt(btex $\Re$ etex, (x0+0.5u, 0));
label.top(btex $\Im$ etex, (0, y0+0.5u));
label.ulft(btex $\rho$ etex, 0.5z0);
label(btex $\theta$ etex, 1/2z4);


dotlabel.urt(btex $z$ etex, z0);
label.llft(btex $0$ etex, origin);
dotlabel.bot(btex $x$ etex, (x0,0));
dotlabel.lft(btex $y$ etex, (0,y0));

endfig;



vardef inv(expr x) =
	(x, 1/x){1, -x*x}
enddef;

beginfig(3);

numeric u; u=1cm;

path fun;

numeric b, e, v; b=3; e = 60; v = 2.7182818284590452353602874713527;

fun = inv(b/10) scaled u
for i = b+1 upto e:
	.. inv(i/10) scaled u
endfor;

path xax, yax;
xax = (-2mm,0) -- (e/10*u + 5mm,0);
yax = (0,-2mm) -- (0, u/(b/10)+5mm);

path one; one = (u,0) -- (u, u);
path val; val = (v*u,0) -- (v*u,u);


%draw one;
%draw val;

path integral; integral = buildcycle(xax, val, fun, one);

fill integral withcolor 8/10[red, white];

z0=center integral;

pickup pencircle scaled 0.4pt;
draw (u,0)--(u,u) withcolor red;
draw (u*v,0) -- (u*v, u/v) withcolor red;
drawarrow xax;
drawarrow yax;

pickup pencircle scaled 0.3mm;
draw fun withcolor red;

label.bot(btex $\ln x$ etex, z0);

dotlabel.lft(btex $\mathstrut 1$ etex, (0,u));
dotlabel.bot(btex $\mathstrut 1$ etex, (u,0));
%dotlabel.bot(btex $\mathstrut 2$ etex, (2u,0));
%dotlabel.bot(btex $\mathstrut 3$ etex, (3u,0));
dotlabel.bot(btex $\mathstrut x$ etex, (u*v,0));
label.rt(btex $\displaystyle{y={1\over x}}$ etex, (b/10 * u+3mm, u/b * 10));

label.rt(btex $x$ etex, (e/10*u + 5mm,0));
label.top(btex $y$ etex, (0, u/(b/10)+5mm));


endfig;



vardef ben(expr x) =
    (mexp(uniformdeviate(mlog(x))) - 1) / (x - 1)
enddef;

beginfig(4);
    color dirt; dirt = (0.7, 0.5, 0.1);
    numeric ux, uy;
    % ux := 90mm;  uy := 31/6pt;
    ux := 1in; uy := 22/3pt;
    pickup pensquare scaled 0.1mm;
    for i = 1 upto 100:
        numeric p; p := ben(10) * ux;
        draw (p,0) -- (p,uy) withcolor dirt;
    endfor;
    pickup pensquare scaled 0.4pt;
    draw origin--(ux,0)--(ux,uy)--(0,uy)--cycle;
	if false:
		for i = 0 upto 9:
			draw (i*ux/9, uy) -- (i*ux/9, uy+0.8pt);
		endfor;
		for i = 1 upto 9:
			label.top(TEX("$\scriptscriptstyle" & decimal i & "$"),((i-0.5)*ux/9, uy-1.5pt));
		endfor;
	fi
endfig;

beginfig(5);
    numeric u; u = 3cm;
    numeric a; a = 1.34934;
    numeric b; b = 2.04249;
    numeric c; c = a ++ b;
    numeric s; s = (a + b + c)/2;
    numeric P; P = u * (b*b + c*c - a*a) / 2;
	numeric Q; Q = 2u * sqrt((s-a)*(s-b)*(s-c)*s);
    pair A; A = origin;
    pair B; B = (c * u, 0) + A;
    pair C; C = (P/c, Q/c) + A;
    pair mA; mA = 1/2[B, C];
    pair mB; mB = 1/2[A, C];
    pair mC; mC = 1/2[A, B];
    numeric aA; aA = angle(C-A);
    numeric aB; aB = aA - 90;
    pair o; o = (0, 3mm);
    label(btex $\ln(x)$ etex rotated aB, mA + (o rotated aB));
    label(btex $\ln(2x)$ etex rotated aA, mB + (o rotated aA));
    label(btex $\ln(3x)$ etex, mC - o);
    o := (3mm, 0);
    label(btex $A$ etex, A - (o rotated 1/2aA));
    label(btex $B$ etex, B + (o rotated 1/2aB));
    label(btex $C$ etex, C + (o rotated (1/2aA+45)));
    pickup pencircle scaled 0.4pt;
    draw (right -- right+up -- up) rotated (aA + 180) scaled 3mm shifted C;
    pickup pencircle scaled 0.3mm;
    draw A--B--C--cycle;
endfig;


end.