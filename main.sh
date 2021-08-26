parallel --no-notice rm -r ::: s1/* s2/* s3/* s4/* s5/* s6/* s7/* s8/* s9/* s10/* s11/* s12/* s13/*
parallel --no-notice rm -r ::: s14/* s15/* s16/* s17/* s18/* s19/* s20/* s21/* s22/* s23/* s24/* s25/*
cd s
for f in *\ *; do mv "$f" "${f// /_}"; done
cd ..
cd s
parallel convert {} -resize 1900x1900 {.}.png ::: *.* 
rm *.jpg
rm *.JPG
parallel convert {} ../s25/{} ::: *.*
cd ..
cd s
parallel convert {} -modulate 100,150,100  ../s1/{} ::: *.* 
cd ..
cd s1
for i in *.* 
do 
convert $i ../s/$i -alpha set -channel A -evaluate set 100% -compose softlight -composite ../s3/$i 
done 
cd .. 
cd s3
parallel gmic {} -fx_poster_edges 20,30,5,0,10,0,0,0 -o ../s4/{} ::: *.* 
cd ..
cd s4
for i in *.*; do
   convert $i  -set filename:new ../s25/"%tsket" "%[filename:new].png"
done
cd ..
cd s
for i in *.*; do
convert $i  -set filename:new ../s20/"%t" "%[filename:new].png"
done
cd .. 
cd s4
for i in *.*; do
   convert $i  -set filename:new ../s21/"%t" "%[filename:new].png"
done
cd ..
cd s20
for i in *.* 
do 
convert $i ../s21/$i -alpha set  -compose softlight -composite ../s22/$i 
done 
cd .. 
cd s22
for i in *.* 
do 
convert $i ../s21/$i -alpha set  -compose screen -composite ../s10/$i 
done 
cd ..
cd s
parallel gmic {} -fx_sketchbw 3,45,180,30,1.75,0.02,0.5,0.75,0.1,0.7,3,6,0,1,4,0,50,50 -o ../s1/{} ::: *.* 
cd ..
cd s1
parallel convert {} -modulate 100,150,100  ../s2/{} ::: *.* 
cd .. 
cd s2
for i in *.*; do
   convert $i  -set filename:new ../s7/"%t" "%[filename:new].png"
done
cd ..
cd s7
for i in *.* 
do 
convert $i ../s22/$i -alpha set  -compose softlight -composite ../s8/$i 
done 
cd .. 
cd s8
for i in *.* 
do 
convert $i ../s10/$i -alpha set  -compose pinlight -composite ../s13/$i 
done 
cd ..
cd s13
parallel gmic {} -fx_corvo_painting_5 35,10,10,0.18,15,0.3,5,2,5,1 -o ../s14/{} ::: *.* 
cd .. 
cd s14
for i in *.*; do
   convert $i  -set filename:new ../s25/"%tsketwater" "%[filename:new].png"
done
cd ..
cd s14
for i in *.* 
do 
convert -modulate 100,120,100 $i ../s1/$i
done
cd ..
th foldertest.lua -model_t7 data/checkpoints/sh.t7 -input_dir s -output_dir s2 &&
cd s1 
for i in *.* 
do 
convert $i ../s2/$i -alpha set  -compose softlight -composite ../s3/$i 
done 
cd .. 
cd s3
for i in *.* 
do
gmic -input $i -fx_AbstractFlood 1,10,7,2,0,10,5,3,255,255,255,255,0,300,10,90,0.7,0,0,0 -o ../s4/$i
done
cd ..
cd s4
parallel --no-notice convert {}  -set filename:new  ../s25/"%ttoon14" "%[filename:new].png" ::: *.*
cd ..
th foldertest.lua -model_t7 data/checkpoints/tumb3.t7 -input_dir s -output_dir s2 &&
cd s1 
for i in *.* 
do 
convert $i ../s2/$i -alpha set  -compose softlight -composite ../s3/$i 
done 
cd .. 
cd s3
for i in *.* 
do
gmic -input $i -fx_AbstractFlood 1,10,7,2,0,10,5,3,255,255,255,255,0,300,10,90,0.7,0,0,0 -o ../s4/$i
done
cd .. 
cd s4
parallel --no-notice convert {}  -set filename:new  ../s25/"%ttoon15" "%[filename:new].png" ::: *.*
