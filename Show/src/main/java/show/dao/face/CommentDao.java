package show.dao.face;

import java.util.List;


import show.dto.Board;
import show.dto.Comment;

public interface CommentDao {

	public List selectComment(Board board);
	
	public void insertComment(Comment comment);

	public void deleteComment(Comment comment);

	public int countComment(Comment comment);
}
