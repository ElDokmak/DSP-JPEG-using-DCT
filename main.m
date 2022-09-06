img = gettingimage();
dividedImage = splittingimage();
BlockSize = 8;
rows = size(img,1);
columns = size(img,2);

x=rows*columns;
while( mod(x , 8*8) ~= 0  )
    
         x=x+1; 
end

TOT_BLOCKS = x / (BlockSize*BlockSize);
row = 1; col = 1;
I_T_Image = zeros(rows, columns);
T_Image = zeros(rows, columns);
prompt = 'Please enter the quantization factor : ';
r = input(prompt)

    for count=1:TOT_BLOCKS
        dividedImage(:,:,count) = img(row:row+BlockSize-1,col:col+BlockSize-1);
        col = col + BlockSize;
        if(col >= columns)
            col = 1;
            row = row + BlockSize;
            if(row >= rows)
                row = 1;
            end
        end 
        
        
            C = zeros([BlockSize BlockSize]);
            N = zeros([BlockSize BlockSize]);
            s = zeros([BlockSize BlockSize]);
            
            s(:,:) = dividedImage(:,:,count);
            C(:,:) = IMAGECOMP(s(:,:) , r);
            N(:,:) = IMAGEDECOMP(C(:,:) , r);     
            I_T_Image(row:row+BlockSize-1,col:col+BlockSize-1) = N(:,:);
            T_Image(row:row+BlockSize-1,col:col+BlockSize-1) = C(:,:);
    end  

subplot(2,1,1);imshow(uint8(img))
title('Original Image');

subplot(2,1,2);imshow(uint8(I_T_Image))
title('Inverse Transformed Image');

imwrite(uint8(I_T_Image) , 'imagenew.jpg');