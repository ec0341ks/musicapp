class SongsController < ApplicationController
  def index
  end
  def search
    if input_params == ''
      flash[:error] = "アーティスト名を入力してください"
      redirect_to root_path
    else 
      @artists = Song.artists_search(input_params)
      if @artists.first.present?
        @topartists = @artists.take(5)
        @song = Song.music_search_by_id(params[:id])
      else
        flash[:error] = '一致するアーティストはいません'
        redirect_to root_path
      end
    end
  end
  def show
    @song = Song.music_search_by_id(params[:id])
    # 曲のidが一致したコメントを表示する
    @comments = Comment.where(music_id: @song.id)
    # @songのnameでMusixMatchのapiの楽曲検索する
    response = MusixMatch.search_track(:q_track => @song.name)
    response.response["message"]["body"]["track_list"].each do |track|
      # 取得した楽曲のidで歌詞を検索。もし歌詞が取得できれば表示する。
      lyric = MusixMatch.get_lyrics(track["track"]["track_id"])
      if lyric.status_code == 200 && lyric.lyrics.lyrics_body != ""
        @lyric = lyric.lyrics.lyrics_body
      else
        @lyric = "この歌詞はないので、今は開発者のお気に入りの歌詞を表示するね！！" 
        @lyric = @lyric +"
        every day, every time
        今日もあっという間に　done
        何が成せたなんて
        おもわず　drunk and drunk
        くだらないジョーキング
        答えのないトーキング
        All day, all day　All night, all night
  
        始まりはそういつも暗いとこ
        這い上がる　なにも映らないとこ
        やけに明るい世界じゃ嘘のよう
        黒く汚れた心気の持ちよう
        振り替えればいつだって
        同じ失態ばかりで　でもこの情景が変わって
        たらきっとここには立ってない
  
        想定外　のtrouble　が招いてくチャンスを
        重ねていく　最後を
        笑っていたいんだ君と
        透明な世界も恐れないでいたいの
        元へ戻れなんて　望みなんかない
  
        every day, every time
        今日もあっという間に　done
        何が成せたなんて
        おもわず　drunk and drunk
        くだらないジョーキング
        答えのないトーキング
        All day, all day　All night, all night
  
        ねえ、なにが正しい
        もどかしい夜に限って
        皆忙しい揺れる　cell phone
        音求め　driving
        鈍る秒針　みんな忘れ　tripping
        どこまでも行こう
        君と過ごす　wonderland
        あの時からずっと
        変わってない　プラン
  
        想定外　のtrouble　が招いてくチャンスを
        僕らはまだ　知らずに
        目を背けて　透明な世界を
        恐れてるのかも　元へ戻れなんて
  
        溶けていく　night and day
        誰だって　悩んで
        僕らはまた　昨日を悔やんで
        All day, all day
  
        every day, every time
        今日もあっという間に　done
        何が成せたなんて
        おもわず　drunk and drunk
        くだらないジョーキング
        答えのないトーキング
        All day, all day　All night, all night
  
        every day, every time
        今日もあっという間に　done
        何が成せたなんておもわず　drunk and drunk
        くだらないジョーキング
        答えのないトーキング
        All day, all day　All night, all night"
      end
    end
  end
  private
  def input_params
    params[:name_cont].to_s
  end
end