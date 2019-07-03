FROM ubuntu:18.04
LABEL Maintainer="Sean Jungbluth, jungbluth.sean@gmail.com" Version=1.0

RUN apt-get update -qq && apt-get install -qq wget build-essential git gcc curl libpng-dev zlib1g-dev libfreetype6-dev libfontconfig1-dev ghostscript ruby-dev

RUN gem install lolcat

RUN git clone https://github.com/jungbluth/kb_sdk_icon_generator

RUN wget http://www.imagemagick.org/download/delegates/freetype-2.8.1.tar.gz && tar -xvzf freetype-2.8.1.tar.gz && cd /freetype-2.8.1 && ./configure && make && make install

RUN apt-get install -qq imagemagick

RUN wget https://www.imagemagick.org/download/ImageMagick.tar.gz && tar xf ImageMagick.tar.gz && cd ImageMagick-7* && ./configure && make && make install

RUN ldconfig /usr/local/lib

RUN cp /kb_sdk_icon_generator/font/Futura-Condensed-Medium.ttf /usr/share/fonts/truetype/Futura-Condensed-Medium.ttf && fc-cache -f -v

RUN mkdir ~/.magick && cd ~/.magick && curl http://www.imagemagick.org/Usage/scripts/imagick_type_gen > type_gen && find /usr/share/fonts/truetype/ -name "*.ttf" | perl type_gen -f - > type.xml && cp type.xml /usr/local/etc/ImageMagick-7/type.xml

#ENV PATH="/kb_sdk_icon_generator:${PATH}"

ENTRYPOINT [ "/kb_sdk_icon_generator/icon-generator.sh" ]

WORKDIR "/tmp"

