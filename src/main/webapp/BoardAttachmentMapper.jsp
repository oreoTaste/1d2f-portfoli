<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.portfoli.dao.BoardAttachmentDao">

  <resultMap type="BoardAttachment" id="BoardAttachmentMap">
    <id column="attachment_no" property="attachmentNumber" />
    <result column="board_no" property="boardNumber" />
    <result column="file_name" property="fileName" />
    <result column="file_path" property="filePath" />
  </resultMap>
  
  <select id="findAll" resultMap="BoardAttachmentMap">
    SELECT 
      attachment_no, 
      board_no, 
      file_name, 
      file_path 
    FROM pf_board_attachment
    order by attachment_no desc
  </select>

  <insert id="insert" parameterType="BoardAttachment">
    INSERT INTO pf_board_attachment (board_no, file_name, file_path)
    VALUES(#{boardNumber}, #{fileName}, #{filePath})
  </insert>


  <delete id="delete" parameterType="int">
    DELETE
      FROM pf_board_attachment
    WHERE board_no = #{number}
  </delete>

  <update id="update" parameterType="BoardAttachment">
    UPDATE pf_board_attachment
    <set>
    <if test="fileName != null and fileName != ''">
      file_name = #{fileName},
    </if>
    <if test="filePath != null and filePath != ''">
      file_path = #{filePath}
    </if>
    </set>
  </update>

</mapper>






