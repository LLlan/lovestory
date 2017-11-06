
(function($, doc) {
    $.init();
    $.ready(function() {
        var _getParam = function(obj, param) {
            return obj[param] || '';
        };
        /*性别*/
        var userxing = new $.PopPicker();
        userxing.setData([
            {text: '男'},  {text: '女'}
        ]);
        var sex1 = doc.getElementById('sex1');
        sex1.addEventListener('tap', function(event) {
            userxing.show(function(items) {
            	//console.log(JSON.stringify(items[0].text).replace(/\"/g, ""));
            	sex1.value = JSON.stringify(items[0].text).replace(/\"/g, "");
            	if(sex1.value=='男'){
            		doc.getElementById('sex').value="1";
            	}else{
            		doc.getElementById('sex').value="2";
            	}
            	//console.log(sex.value)
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        /*身高*/
       /* var userPicker = new $.PopPicker();
        userPicker.setData([
            {text: '160cm以下'},  {text: '160cm~170cm'}, {text: '170cm~180cm'}, {text: '180cm~190cm'}, {text: '190cm~200cm'}, {text: '200cm以上'}
        ]);
        var showUserPickerButton = doc.getElementById('showUserPicker');
        var userResult = doc.getElementById('showUserPicker');
        showUserPickerButton.addEventListener('tap', function(event) {
            userPicker.show(function(items) {
                userResult.value = JSON.stringify(items[0].text).replace(/\"/g, "");

                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
*/
        /*学历*/
        var userxue = new $.PopPicker();
        userxue.setData([
            {text:'博士 '},{text:'硕士'},{text:'双学位'},{text:'本科'},{text:'专科 '},{text:'其他 '}

        ]);
        var xueli = doc.getElementById('xueli');
        xueli.addEventListener('tap', function(event) {
            userxue.show(function(items) {
            	xueli.value = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        /*婚姻状况*/
        var hun = new $.PopPicker();
        hun.setData([
            {text: '未婚'},{text: '丧偶'}, {text: '离异未育 '}, {text: '离异子女不在身边  '},{text: '离异子女在身边'}
        ]);
        var isHun = doc.getElementById('isHun');
        isHun.addEventListener('tap', function(event) {
            hun.show(function(items) {
            	isHun.value = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        /*民族*/
        var zhu= new $.PopPicker();
        zhu.setData([
            {text: '汉族'},  {text: '少数民族'}
        ]);
        var minzu = doc.getElementById('minzu');
        minzu.addEventListener('tap', function(event) {
            zhu.show(function(items) {
            	minzu.value = JSON.stringify(items[0].text).replace(/\"/g, "");

                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);

        /*户口所在地*/
        var cityPicker3 = new $.PopPicker({
            layer: 3
        });
        cityPicker3.setData(cityData3);
        var hukouszd = doc.getElementById('hukouszd');
        hukouszd.addEventListener('tap', function(event) {
            cityPicker3.show(function(items) {
            	hukouszd.value = _getParam(items[0], 'text')+" "+  _getParam(items[1], 'text')+" "+  _getParam(items[2], 'text');
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        /*现居住地*/
        var cityPicker4 = new $.PopPicker({
            layer: 3
        });
        cityPicker4.setData(cityData3);
        var juzhudi = doc.getElementById('juzhudi');
        juzhudi.addEventListener('tap', function(event) {
            cityPicker4.show(function(items) {
            	juzhudi.value = _getParam(items[0], 'text')+" "+  _getParam(items[1], 'text')+" "+  _getParam(items[2], 'text');
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        /*是否独生子女*/
        var nv = new $.PopPicker();
        nv.setData([
            {text: '是'},  {text: '否'}
        ]);
        var isOnly = doc.getElementById('isOnly');
        isOnly.addEventListener('tap', function(event) {
            nv.show(function(items) {
            	isOnly.value = JSON.stringify(items[0].text).replace(/\"/g, "");

                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        /*有无子女*/
       /* var du = new $.PopPicker();
        du.setData([
            {text: '是'},  {text: '否'}
        ]);
        var show4 = doc.getElementById('info11');
        var user4 = doc.getElementById('info11');
        show4.addEventListener('tap', function(event) {
            du.show(function(items) {
                user4.value = JSON.stringify(items[0].text).replace(/\"/g, "");

                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);*/
        ///*职务*/
        //var userzw = new $.PopPicker();
        //userzw.setData([
        //    {text:'商务'},{text:'公关'},{text:'人事'},{text:'行政'},{text:'财务'},
        //    {text:'法务'},{text:'工程师'},{text:'运营'},{text:'分析师'},{text:'翻译'},
        //    {text:'科研人员'},{text:'工互联网'}
        //]);
        //var showzw = doc.getElementById('zw');
        //var userzhiwu = doc.getElementById('zw');
        //showzw.addEventListener('tap', function(event) {
        //    userzw.show(function(items) {
        //        userzhiwu.innerText = JSON.stringify(items[0].text).replace(/\"/g, "");
        //        //返回 false 可以阻止选择框的关闭
        //        //return false;
        //    });
        //}, false);

        /*年薪*/
        var userysr = new $.PopPicker();
        userysr.setData([
            {text:'3w以下'},{text:'3w~5w'},{text:'5w~10w'},{text:'10w~20w'},{text:'20w以上'}

        ]);
        var nianxin = doc.getElementById('nianxin');
        nianxin.addEventListener('tap', function(event) {
            userysr.show(function(items) {
            	nianxin.value = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);

        /*房/车情况*/
        var fang = new $.PopPicker();
        fang.setData([
            {text: '有房有车'}, {text: '有房无车'}, {text: '无房有车'},{text: '无房无车'}
        ]);
        var isFngCar = doc.getElementById('isFngCar');
        isFngCar.addEventListener('tap', function(event) {
            fang.show(function(items) {
            	isFngCar.value = JSON.stringify(items[0].text).replace(/\"/g, "");

                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        /*父母健在情况*/
        var mu = new $.PopPicker();
        mu.setData([
            {text: '是'},  {text: '否'}
        ]);
        var isParent = doc.getElementById('isParent');
        isParent.addEventListener('tap', function(event) {
            mu.show(function(items) {
            	isParent.value = JSON.stringify(items[0].text).replace(/\"/g, "");

                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        /*择偶标准---年龄*/
        var _age = new $.PopPicker();
        _age.setData([
            {text: '18岁~25岁'},  {text: '25岁~30岁'}, {text: '30岁~35岁'}, {text: '35岁~40岁'}, {text: '40岁~45岁'}, {text: '45岁~50岁'}, 
            {text: '50岁~55岁'}, {text: '55岁~60岁'}, {text: '60岁~65岁'}, {text: '65岁~70岁'}, {text: '70岁~75岁'}, {text: '75岁~80岁'}, 
            {text: '80岁~85岁'}, {text: '85岁~90岁'}, {text: '90岁~95岁'}, {text: '95岁~100岁'}
        ]);
        var zo_age = doc.getElementById('zo_age');
        zo_age.addEventListener('tap', function(event) {
        	_age.show(function(items) {
        		zo_age.value = JSON.stringify(items[0].text).replace(/\"/g, "");

                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        /*择偶标准---身高*/
        var height = new $.PopPicker();
        height.setData([
           {text: '160cm以下'},  {text: '160cm~170cm'}, {text: '170cm~180cm'}, {text: '180cm~190cm'}
           , {text: '190cm~200cm'}, {text: '200cm以上'}
          ]);
        var zo_shengao = doc.getElementById('zo_shengao');
        zo_shengao.addEventListener('tap', function(event) {
        	height.show(function(items) {
        		zo_shengao.value = JSON.stringify(items[0].text).replace(/\"/g, "");
        		
        		//返回 false 可以阻止选择框的关闭
        		//return false;
        	});
        }, false);

        /*择偶标准---学历*/
        var userli = new $.PopPicker();
        userli.setData([
            {text:'博士 '},{text:'硕士'},{text:'双学位'},{text:'本科'},{text:'专科 '},{text:'其他 '},{text:'均可'}

        ]);
        var zo_xueli = doc.getElementById('zo_xueli');
        zo_xueli.addEventListener('tap', function(event) {
            userli.show(function(items) {
            	zo_xueli.value = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
        /*择偶标准---婚姻状况*/
        var yin = new $.PopPicker();
        yin.setData([
            {text: '未婚'},{text: '丧偶'}, {text: '离异未育 '}, {text: '离异子女不在身边  '},{text: '离异子女在身边'}
        ]);
        var zo_isHun = doc.getElementById('zo_isHun');
        zo_isHun.addEventListener('tap', function(event) {
            yin.show(function(items) {
            	zo_isHun.value = JSON.stringify(items[0].text).replace(/\"/g, "");

                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);
    });
})(mui, document);

