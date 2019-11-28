(
    function (window) {
        function musicplay($autio) {
            return new musicpaly.prototype.init($audio);
        }
        musicplay.prototype= {
            constructor:musicplay,
            muscilist:[],
            init : function($audio) {
                this.$audio = $audio;
                this.audio = $audio.get(0);
            },
            currentmusic:-1,//记录当前的歌曲是哪一首
            playmusic:function (index,ele) {
                //判断是否是同一首歌曲，这里出现了很多次的奇怪bug
                if(this.currentmusic===index)
                {
                    //同一首音乐
                    if(this.audio.paused)
                    {
                        this.audio.play();
                    }
                    else
                    {
                        this.autio.pause();
                    }
                }
                else
                {
                    //不是同一首音乐
                    this.$audio.attr("src",ele.data.play_url);
                    this.audio.play();
                }
            }
        }
        musicplay.prototype.init.prototype=musicplay.prototype;
        window.musicpaly=musicpaly;
    }
)(window)