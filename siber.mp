input TEX;

vardef mmang expr x = 
    (-x * 180/50)
enddef;

vardef mmdir expr x = 
    dir(90 + mmang(x))
enddef;

vardef log expr x =
    (-mlog(x) * 0.61072661517644788263440004222648)
enddef;

vardef logdir expr x = 
    dir(90 + log(x))
enddef;

vardef sinang expr x =
    (-360*sind(x))
enddef;

vardef sindir expr x =
    dir(90+sinang(x))
enddef;

numeric pi; pi = 3.1415926535897932384626433832795;
numeric ee; ee = 2.7182818284590452353602874713527; 

beginfig(10);
    numeric r; r = 8cm;
    numeric q; q = r+10mm;

    pickup pencircle scaled 0.2pt;

    draw fullcircle scaled (2q + 10mm) dashed evenly;

    draw fullcircle scaled 2q;
    draw fullcircle scaled 2r;
    fill fullcircle scaled 0.5mm;
    % dotlabel("", origin);

    pair p;
    numeric ang;

    numeric s; 
    s=r-7mm;

    for i := 1 upto 299:
        p := sindir(i/10);
        ang := sinang(i/10);
        draw p scaled  q -- (p scaled q) + (p scaled 0.7mm);
    endfor;
    for i := 0 upto 89:
        p := sindir(i);
        ang := sinang(i);
        draw p scaled  q -- (p scaled q) + (p scaled 1mm);
    endfor;
    for i := 0 upto 59:
        p := sindir(i+1/2);
        ang := sinang(i+1/2);
        draw p scaled  q -- (p scaled q) + (p scaled 1mm);
    endfor;
    for i := 0 upto 70:
        p := sindir(i);
        ang := sinang(i);
        draw thelabel(TEX( "$\scriptscriptstyle{" & decimal(i) & "}$" ), origin) rotated ang shifted (p scaled (q+2mm));
    endfor;
    for i := 75 step 5 until 80:
        p := sindir(i);
        ang := sinang(i);
        draw thelabel(TEX( "$\scriptscriptstyle{" & decimal(i) & "}$" ), origin) rotated ang shifted (p scaled (q+2mm));
    endfor;

    for i := 0 upto 999:
        p := mmdir(i/10);
        draw p scaled r -- (p scaled r) + (p scaled 1mm);
    endfor;
    for i := 0 upto 99:
        p := mmdir(i);
        draw p scaled r -- (p scaled r) + (p scaled 2mm);
    endfor;
    for i := 0 upto 99:
        p := mmdir(i+0.5);
        draw p scaled r -- (p scaled r) + (p scaled 1.5mm);
    endfor;
    for i := 0 upto 19:
        p := mmdir(5i);
        draw p scaled r-- (p scaled r) + (p scaled 3mm);
    endfor;
    for i := 0 upto 9:
        p := mmdir(10i);
        draw p scaled r -- (p scaled r) + (p scaled 4mm);
    endfor;


    for i := 100 upto 299:
        p := logdir(i/100);
        draw p scaled r -- (p scaled r) - (p scaled 1mm);
    endfor;
    for i := 150 upto 299:
        p := logdir(i/50);
        draw p scaled r -- (p scaled r) - (p scaled 1mm);
    endfor;
    for i := 10 upto 29:
        p := logdir(i/10+1/20);
        draw p scaled r -- (p scaled r) - (p scaled 1.5mm);
    endfor;
    for i := 10 upto 99:
        p := logdir(i/10);
        draw p scaled r -- (p scaled r) - (p scaled 2mm);
    endfor;
    for i := 1 upto 9:
        p := logdir(i+1/2);
        draw p scaled r -- (p scaled r) - (p scaled 3mm);
    endfor;
    for i := 1 upto 9:
        p := logdir(i);
        draw p scaled r -- (p scaled r) - (p scaled 4mm);
    endfor;
    p := logdir(pi);
    draw (p scaled r) - (p scaled 2mm) -- (p scaled r) - (p scaled 4mm);
    p := logdir(ee);
    draw (p scaled r) - (p scaled 2mm) -- (p scaled r) - (p scaled 4mm);


    % p := mmdir(0);
    % ang := mmang(0);
    % draw thelabel("0", origin) rotated ang shifted (p scaled 86.5mm);
    for i := 0 upto 9:
        p := mmdir(10i);
        ang := mmang(10i);
        draw thelabel(TEX( "0," & decimal(i) & "" ), origin) rotated ang shifted (p scaled 86.5mm);
    endfor;

    numeric tick;
    for j := 0 upto 9:
    for i := 1 upto 9:
        tick := 10*j+i;
        p := mmdir(tick);
        ang := mmang(tick);
        draw thelabel(TEX( "$\scriptstyle{" & decimal(i) & "}$" ), origin) rotated ang shifted (p scaled 86.5mm);
    endfor;
    endfor;

    for i := 1 upto 9:
        p := logdir(i); ang := log(i);
        draw thelabel(TEX( "$" & decimal(i) & "$" ), origin) rotated ang shifted (p scaled s);
    endfor;
    for i := 3 upto 9:
        p := logdir(i+1/2); ang := log(i+1/2);
        draw thelabel(TEX( "$\scriptstyle{" & decimal(i) & "{,}5}$" ), origin) rotated ang shifted (p scaled s);
    endfor;
    for i := 11 upto 19:
        p := logdir(i/10); ang := log(i/10);
        draw thelabel(TEX( "$\scriptstyle{" & decimal(i div 10) & "{,}" & decimal(i mod 10) & "}$" ), origin) rotated ang shifted (p scaled s);
    endfor;
    for i := 21 upto 26:
        p := logdir(i/10); ang := log(i/10);
        draw thelabel(TEX( "$\scriptstyle{" & decimal(i div 10) & "{,}" & decimal(i mod 10) & "}$" ), origin) rotated ang shifted (p scaled s);
    endfor;
    for i := 28 upto 29:
        p := logdir(i/10); ang := log(i/10);
        draw thelabel(TEX( "$\scriptstyle{" & decimal(i div 10) & "{,}" & decimal(i mod 10) & "}$" ), origin) rotated ang shifted (p scaled s);
    endfor;

    p := logdir(pi); ang := log(pi);
    draw thelabel(TEX( "$\pi$" ), origin) rotated ang shifted (p scaled s);
    p := logdir(ee); ang := log(ee);
    draw thelabel(TEX( "${\bf e}$" ), origin) rotated ang shifted (p scaled s);



    r := r-14mm;
    draw fullcircle scaled 2r withcolor 1/3white;
    
    for i := 100 upto 299:
        p := logdir(i/100);
        draw p scaled r -- (p scaled r) - (p scaled 1mm);
        draw p scaled r -- (p scaled r) + (p scaled 1mm);
    endfor;
    for i := 150 upto 299:
        p := logdir(i/50);
        draw p scaled r -- (p scaled r) - (p scaled 1mm);
        draw p scaled r -- (p scaled r) + (p scaled 1mm);
    endfor;
    for i := 10 upto 29:
        p := logdir(i/10+1/20);
        draw p scaled r -- (p scaled r) - (p scaled 1.5mm);
        draw p scaled r -- (p scaled r) + (p scaled 1.5mm);
    endfor;
    for i := 10 upto 99:
        p := logdir(i/10);
        draw p scaled r -- (p scaled r) - (p scaled 2mm);
        draw p scaled r -- (p scaled r) + (p scaled 2mm);
    endfor;
    for i := 1 upto 9:
        p := logdir(i+1/2);
        draw p scaled r -- (p scaled r) - (p scaled 3mm);
        draw p scaled r -- (p scaled r) + (p scaled 3mm);
    endfor;
    for i := 1 upto 9:
        p := logdir(i);
        draw p scaled r -- (p scaled r) - (p scaled 4mm);
        draw p scaled r -- (p scaled r) + (p scaled 4mm);
    endfor;
    p := logdir(pi);
    draw (p scaled r) - (p scaled 2mm) -- (p scaled r) - (p scaled 4mm);
    draw (p scaled r) + (p scaled 2mm) -- (p scaled r) + (p scaled 4mm);
    p := logdir(ee);
    draw (p scaled r) - (p scaled 2mm) -- (p scaled r) - (p scaled 4mm);
    draw (p scaled r) + (p scaled 2mm) -- (p scaled r) + (p scaled 4mm);


    s:=r-7mm;

    for i := 1 upto 9:
        p := logdir(i); ang := log(i);
        draw thelabel(TEX( "$" & decimal(i) & "$" ), origin) rotated ang shifted (p scaled s);
    endfor;
    for i := 3 upto 9:
        p := logdir(i+1/2); ang := log(i+1/2);
        draw thelabel(TEX( "$\scriptstyle{" & decimal(i) & "{,}5}$" ), origin) rotated ang shifted (p scaled s);
    endfor;
    for i := 11 upto 19:
        p := logdir(i/10); ang := log(i/10);
        draw thelabel(TEX( "$\scriptstyle{" & decimal(i div 10) & "{,}" & decimal(i mod 10) & "}$" ), origin) rotated ang shifted (p scaled s);
    endfor;
    for i := 21 upto 26:
        p := logdir(i/10); ang := log(i/10);
        draw thelabel(TEX( "$\scriptstyle{" & decimal(i div 10) & "{,}" & decimal(i mod 10) & "}$" ), origin) rotated ang shifted (p scaled s);
    endfor;
    for i := 28 upto 29:
        p := logdir(i/10); ang := log(i/10);
        draw thelabel(TEX( "$\scriptstyle{" & decimal(i div 10) & "{,}" & decimal(i mod 10) & "}$" ), origin) rotated ang shifted (p scaled s);
    endfor;

    p := logdir(pi); ang := log(pi);
    draw thelabel(TEX( "$\pi$" ), origin) rotated ang shifted (p scaled s);
    p := logdir(ee); ang := log(ee);
    draw thelabel(TEX( "${\bf e}$" ), origin) rotated ang shifted (p scaled s);


endfig;

end.