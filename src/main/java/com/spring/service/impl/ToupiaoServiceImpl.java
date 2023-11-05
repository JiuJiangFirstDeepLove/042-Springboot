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

@Service("ToupiaoService")
public class ToupiaoServiceImpl implements ToupiaoService {

    @Resource
    private ToupiaoMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Toupiao> select() {
        return dao.select(null);
    }

    /**
     * 根据Toupiao类搜索数据
     * @param y
     * @return
     */
    public List<Toupiao> select(Toupiao y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取投票一行数据
     * @param id
     * @return
     */
    public Toupiao find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据投票获取投票类条件查询一行数据
     * @param id
     * @return
     */
    public Toupiao findEntity(Toupiao id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Toupiao> selectPage(Toupiao obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Toupiao> list = select(obj);
        PageInfo<Toupiao> pageInfo = new PageInfo(list);
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
    public List<Toupiao> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Toupiao> list = dao.selectByExample(obj);
        PageInfo<Toupiao> pageInfo = new PageInfo(list);
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
     * 插入投票     * @param y
     * @return
     */
    public int insert(Toupiao y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新投票     * @param y
     * @return
     */
    public int update(Toupiao y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
