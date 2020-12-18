package dto;

import java.sql.Date;

public class PostReplyDTO {
   private int id;
   private int post_id;
   private int cat_user_id;   
   private String content;   
   private int like_count;
   private Date createdAt;
   private Date updatedAt;
   
   public PostReplyDTO() {

   }

   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public int getPost_id() {
      return post_id;
   }

   public void setPost_id(int post_id) {
      this.post_id = post_id;
   }

   public int getCat_user_id() {
      return cat_user_id;
   }

   public void setCat_user_id(int cat_user_id) {
      this.cat_user_id = cat_user_id;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public int getLike_count() {
      return like_count;
   }

   public void setLike_count(int like_count) {
      this.like_count = like_count;
   }

   public Date getCreatedAt() {
      return createdAt;
   }

   public void setCreatedAt(Date createdAt) {
      this.createdAt = createdAt;
   }

   public Date getUpdatedAt() {
      return updatedAt;
   }

   public void setUpdatedAt(Date updatedAt) {
      this.updatedAt = updatedAt;
   }

   
   
}