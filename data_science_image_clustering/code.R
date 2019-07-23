install.packages(\"jpeg\")

#(Installing a library for loading images)

library(jpeg)

#(load library)

image = readJPEG(\'c:/house.jpeg\')

#(Bring in an image and put it in a variable.)

dim(image)

#(You can see that Dimension is X by X 3 (rgb).)

plot(1:2, type=\"n\", xlab=\'\', ylab=\'\')

#(I made an empty plot.)

rasterImage(image, 1, 1, 2, 2)

#(Load the image to the desired size.)

image\[1,1,\]

#(Check the rgb value of the pixel(1,1).)

image.dataframe = data.frame(r=as.vector(image\[,,1\]),
    g=as.vector(image\[,,2\]), b=as.vector(image\[,,3\]))

# (Now the data has been transformed to apply K-means clustering.
#
# Since the concept of horizontal or vertical in segmentation was
# meaningless anyway, it was transformed into a one-dimensional vector
# and transformed into a three-dimensional data type of (r, g, b).)

   dim(image.dataframe)

# (Verifies that the exact number of data samples is equal to the number
# of pixels)

   head(image.dataframe)

# (Check only the first part using the head function)

   kmeans.fit = kmeans(image.dataframe, centers=6, nstart=5)

# (These pixels were separated by a cluster of random numbers (K=6).)

   kmeans.fit\$centers

#(Then, check what these segmented pixels look like.

# To do so, the data is restored to the original array format.)

   kmeansCompressed.dataframe =
    kmeans.fit\$centers\[kmeans.fit\$cluster,\]

# (each pixel\'s data is filled with the data from the pentroid.)

   dim(kmeansCompressed.dataframe)

   kmeansCompressed = array(kmeansCompressed.dataframe, dim(image))

# (Move the dataframe type back to the array format.)

   dim(kmeansCompressed)

# (Confirmation that it is again in the form of (street, vertical, 3))

   plot(1:2, type=\"n\", xlab=\'\', ylab=\'\')

   rasterImage(kmeansCompressed, 1, 1, 2, 2)

# (get the result picture)
#