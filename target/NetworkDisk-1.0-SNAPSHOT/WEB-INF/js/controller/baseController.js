app.controller("baseController",function ($scope) {
    //分页的配置信息
    $scope.paginationConf = {
        currentPage: 1,
        totalItems: 10,  //后台获取
        itemsPerPage: 10,
        perPageOptions: [10, 20, 30, 40, 50],
        onChange: function(){
            $scope.reloadList();//重新加载
        }
    };

    $scope.searchEntity={};
    $scope.reloadList=function () {
        $scope.search($scope.paginationConf.currentPage,$scope.paginationConf.itemsPerPage,$scope.searchEntity);
    }

    //保存勾选准备删除的ID信息
    $scope.selectIds=[];
    $scope.addId=function ($event,id) {
        if($event.target.checked){
            $scope.selectIds.push(id);
        }else{
            var index = $scope.selectIds.indexOf(id);
            $scope.selectIds.splice(index,1);
        }
    }
})