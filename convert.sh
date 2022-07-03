# converts all files in your current directory to CMYK

## FOR WINDOWS:
# ensure you install the imagemagick library (https://imagemagick.org/script/download.php) Windows Binary Release
# run the file by double clicking on this bash file in the directory it's located in

# You must have ImageMagick: https://imagemagick.org/script/index.php
# for Mac open terminal and run "brew install imagemagick"
# if you don't have homebrew (Mac): https://brew.sh/
# Using command line, navigate to a directory with all of your images to be created
# run "bash [PATH_TO_CONVERT.SH]" and all the files in the directory will be converted to CMYK
# for FILE in *;
# do 

# replace spaces with underscores in file names

for f in *\ *; do mv "$f" "${f// /_}"; done


# convert .JPG to .jpg
for x in `find . -maxdepth 1 -type f -name "*.JPG"` ;
do 
    mv "$x" `echo $x|sed 's/JPG/jpg/g'`; 
done

# convert .jpeg to .jpg
for x in `find . -maxdepth 1 -type f -name "*.jpeg"` ;
do 
    mv "$x" `echo $x|sed 's/jpeg/jpg/g'`; 
done

# convert .nef to .jpg
for x in `find . -maxdepth 1 -type f -name "*.nef"` ;
do 
    mv "$x" `echo $x|sed 's/nef/jpg/g'`; 
done

# convert .NEF to .jpg
for x in `find . -maxdepth 1 -type f -name "*.NEF"` ;
do 
    mv "$x" `echo $x|sed 's/NEF/jpg/g'`; 
done

# convert .png to .jpg
for x in `find . -maxdepth 1 -type f -name "*.png"` ;
do 
    mv "$x" `echo $x|sed 's/png/jpg/g'`; 
done

count=0;
mkdir converted
for FILE in *;
do
    if test -f $FILE;
    then
        if [[ $FILE == *.jpg ]];
        then
            magick convert $FILE -colorspace cmyk converted/${FILE%.jpg}_CMYK.jpg;
	    ((count=count+1));
        fi
    fi
done
echo "Success! Converted $count images."
