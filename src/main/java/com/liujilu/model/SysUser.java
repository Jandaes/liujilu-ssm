package com.liujilu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import java.util.Date;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 		用户信息表
 * </p>
 *
 * @since 2017-07-31
 */
@TableName("sys_user")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysUser extends Model<SysUser> {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
	@TableId(value="id", type= IdType.ID_WORKER)
	private String id;
    /**
     * 姓名
     */
	private String name;
    /**
     * 昵称
     */
	private String nickname;
    /**
     * 邮箱
     */
	private String email;
    /**
     * Q号码
     */
	private String number;
    /**
     * 密码
     */
	private String password;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 最后登录时间
     */
	@TableField("last_login_time")
	private Date lastLoginTime;
    /**
     * 状态：0 锁定、 1 正常
     */
	private Integer status;
	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
