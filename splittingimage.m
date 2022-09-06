function s = splittingimage()
InputImage = gettingimage();
img = InputImage;
rows = size(img,1);
columns = size(img,2);
BlockSize = 8;


x=rows*columns;

while( mod(x , 8*8) ~= 0  )
    
         x=x+1; 
end


TOT_BLOCKS = x / (BlockSize*BlockSize);
s = zeros([BlockSize BlockSize TOT_BLOCKS]);
