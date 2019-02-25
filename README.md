# seedbox

deluged
qbittorrent
rtorrent 0.9.7
rutorrent
nginx

## RUN Docker
sudo docker run -it -d --name chris-seedbox -v $HOME/seedbox:/share -v $HOME/projects:/projects
-p 58880:80 -p 58443:443 -p 58080:58080 -p 58112:58112 -p 34500-34550:34500-34550 -p 58840-58860:58840-58860 -p 36880-36900:36880-36900 -p 58999:58999
seedbox
