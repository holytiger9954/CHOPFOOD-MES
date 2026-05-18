package kr.or.chop.P04_sugg.dao;

import java.util.List;

import kr.or.chop.P04_sugg.dto.CommentDTO;

public interface CommentDAO {

    List<CommentDTO> selectCommentList(int comm_sugg_no);

    int insertComment(CommentDTO dto);

    int updateComment(CommentDTO dto);

    int deleteComment(int comm_no);
}
