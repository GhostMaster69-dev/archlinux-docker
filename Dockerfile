FROM scratch
ADD archlinux.tar /
ENV LANG=en_US.UTF-8
CMD ["/usr/bin/bash"]

RUN pacman -Syuq --noconfirm git base-devel sudo

#RUN echo "Defaults         lecture = never" > /etc/sudoers.d/privacy \
 #&& echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel \
 #&& useradd -m -G wheel -s /bin/bash builder

USER builder
RUN mkdir -p /home/builder

# Install all required packages
COPY install_deps.sh /tmp/
RUN bash /tmp/install_deps.sh