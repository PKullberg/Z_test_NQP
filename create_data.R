### Create dummy data for Z nqp tests
setwd("C:/HY-Data/KULLBERG/Peter/NQP_test/")

library(raster)

t1 <- matrix(1, 100, 100)
t1[c(1, 100),  ] <- NA
t1[ ,c(1, 100)] <- NA
tr1 <- raster(t1)
writeRaster(tr1, "base_spp.tif", NAflag=-1, format="GTiff", overwrite = T)

par(mfrow=c(3,5))
for (i in 2:10) {
  x1 <- floor(runif(1, 0, 100))
  x2 <- floor(runif(1, x1, 100))
  y1 <- floor(runif(1, 0, 100))
  y2 <- floor(runif(1, y1, 100))
  
  t <- matrix(0, 100, 100)
  t[x1:x2, y1:y2] <- 1
  t[c(1, 100),  ] <- NA
  t[ ,c(1, 100)] <- NA
  rast <- raster(t)
  plot(rast)
  writeRaster(rast, paste("tr", i, sep = ""), NAflag=-1, format="GTiff", overwrite = T)
}

par(mfrow=c(3,5))
for (i in 11:15) {
  y1 <- floor(runif(1, 0, 100))

  t <- matrix(0, 100, 100)
  t[ ,y1:100 ] <- 1
  t[c(1, 100),  ] <- NA
  t[ ,c(1, 100)] <- NA
  rast <- raster(t)
  plot(rast)
  writeRaster(rast, paste("tr", i, sep = ""), NAflag=-1, format="GTiff", overwrite = T)
}

pl <- matrix(0, 100, 100)
pl[0:25, 0:25] <- 1
pl[0:25, 25:50] <- 2
pl[0:25, 50:75] <- 3
pl[0:25, 75:100] <- 4
pl[25:50, 0:25] <- 5
pl[25:50, 25:50] <- 6
pl[25:50, 50:75] <- 7
pl[25:50, 75:100] <- 8
pl[50:100, 0:100] <- 9
pl[c(1, 100),  ] <- NA
pl[ ,c(1, 100)] <- NA
plr <- raster(pl)
writeRaster(plr, "plu.tif", NAflag=-1, format="GTiff", overwrite = T)

hm <- matrix(0, 100, 100)
hm[50:100, ] <- 1
hm[c(1, 100),  ] <- NA
hm[ ,c(1, 100)] <- NA
hmr <- raster(hm)
writeRaster(hmr, "hm.tif", NAflag=-1, format="GTiff", overwrite = T)

hm[1:49, 50:100] <- 2
hm[c(1, 100),  ] <- NA
hm[ ,c(1, 100)] <- NA
hmr <- raster(hm)
writeRaster(hmr, "06_hm.tif", NAflag=-1, format="GTiff", overwrite = T)
