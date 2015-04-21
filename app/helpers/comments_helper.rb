require 'pry'
module CommentsHelper
  def comments_tree_for(comments)
    case comments
    when Hash
      Hash[comments.map { |comment, nested_comments| [comment.as_json, comments_tree_for(nested_comments)] }]
    else
      comments
    end
  end
end
