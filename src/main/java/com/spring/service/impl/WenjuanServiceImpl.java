package com.spring.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.spring.dao.*;
import com.spring.entity.*;
import com.spring.service.*;
import com.spring.util.*;
import java.util.*;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

@Service("WenjuanService")
public class WenjuanServiceImpl implements WenjuanService {

    @Resource
    private WenjuanMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Wenjuan> select() {
        return dao.select(null);
    }

    /**
     * 根据Wenjuan类搜索数据
     * @param y
     * @return
     */
    public List<Wenjuan> select(Wenjuan y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取问卷一行数据
     * @param id
     * @return
     */
    public Wenjuan find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据问卷获取问卷类条件查询一行数据
     * @param id
     * @return
     */
    public Wenjuan findEntity(Wenjuan id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Wenjuan> selectPage(Wenjuan obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Wenjuan> list = select(obj);
        PageInfo<Wenjuan> pageInfo = new PageInfo(list);
        PageInfoUtil pageInfoUtil = new PageInfoUtil(page);
        pageInfoUtil.setPageInfo(Request.getRequest(), pageInfo.getTotal(), pageSize);
        return list;
    }

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Wenjuan> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Wenjuan> list = dao.selectByExample(obj);
        PageInfo<Wenjuan> pageInfo = new PageInfo(list);
        PageInfoUtil pageInfoUtil = new PageInfoUtil(page);
        pageInfoUtil.setPageInfo(Request.getRequest(), pageInfo.getTotal(), pageSize);
        return list;
    }

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id) {
        return dao.deleteByPrimaryKey(id);
    }

    /**
     * 插入问卷     * @param y
     * @return
     */
    public int insert(Wenjuan y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新问卷     * @param y
     * @return
     */
    public int update(Wenjuan y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
