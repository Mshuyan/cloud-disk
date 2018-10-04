app.service("brandService",function ($http) {
    this.findBrandList=function(){
        return $http.post('../brand/findBrandList');
    }
    //分页显示
    this.findPage=function (pageNum,pageSize) {
        return $http.get("../brand/findPage/"+pageNum+"/"+pageSize);
    }
    //根据品牌名称和首字母查询商品并分页显示
    this.search=function (pageNum,pageSize,searchEntity) {
        return $http.post("../brand/search/"+pageNum+"/"+pageSize+"/",searchEntity);
    }

    //查找所有数据显示在页面
    this.findAll=function () {
        return $http.get("../brand/findAll");
    }

    //判断是修改数据还是保存数据，因为他们操作同一个页面，根据是否有ID判断
    this.add=function (entity) {
        return $http.post("../brand/save",entity);
    }

    this.update=function (entity) {
        return $http.post("../brand/update",entity);
    }

    // 单击修改后根据ID查询数据，将数据显示在页面
    this.findOne=function (id) {
        return $http.get("../brand/findOne/"+id);
    }

    //删除数据
    this.delete=function (Ids) {
        return $http.get("../brand/delete/"+Ids);
    }
})