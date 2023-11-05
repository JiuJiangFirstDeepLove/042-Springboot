package com.spring.service;

import com.spring.entity.Wenjuan;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface WenjuanService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Wenjuan> select();

    /**
     * 根据Wenjuan类搜索数据
     * @param y
     * @return
     */
    public List<Wenjuan> select(Wenjuan y);

    /**
     * 根据主键获取问卷一行数据
     * @param id
     * @return
     */
    public Wenjuan find(Object id);

    /**
     * 根据问卷获取问卷类条件查询一行数据
     * @param id
     * @return
     */
    public Wenjuan findEntity(Wenjuan id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Wenjuan> selectPage(Wenjuan obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Wenjuan> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入问卷     * @param y
     * @return
     */
    public int insert(Wenjuan y);

    /**
     * 更新问卷     * @param y
     * @return
     */
    public int update(Wenjuan y);
}
