module ApplicationHelper
  
  # ページごとにタイトルを返す
  def full_title(page_name = "")  # メソッドと引数の定義
    base_title = "Sample" # 基本となるアプリケーション名を変数に代入
    if page_name.empty? # 引数を受け取っているか判定
      base_title  # 引数page_nameが空文字の場合はbase_titleのみ返す
    else  # 引数page_nameが空文字ではない場合
      page_name + " | " + base_title  # 文字列を連結して返す
    end
  end
  
    require "uri"

    def text_url_to_link text
  
      URI.extract(text, ['http','https']).uniq.each do |url|
        sub_text = ""
        sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
  
        text.gsub!(url, sub_text)
      end
  
      return text
    end
end