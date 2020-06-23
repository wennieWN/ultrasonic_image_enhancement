# ultrasonic_image_enhancement

Deng G . A Generalized Unsharp Masking Algorithm[J]. IEEE TRANSACTIONS ON IMAGE PROCESSING, 2011, 20(5):1249-61.

#### Modification

To denoise the ultrasonic image, I modified the gamma value in *GUM.m*

```Matlab
ind = find(abs(c)>0.1 & abs(c)<0.3);
gama(ind) = 0.95;
```

