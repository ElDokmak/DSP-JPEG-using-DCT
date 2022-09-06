function C8=IMAGEDCT(N)
C8=zeros(8,8);
 for n = 1:1:8
     for k = 1:1:8
         if (k==1)
             C8(k , n) = 1/(sqrt(N));
         else 
             C8(k , n) = (sqrt(2/N)) * cos((2*(n-1)+1)*(k-1)*pi/(2*N));
         end
     end
 end


