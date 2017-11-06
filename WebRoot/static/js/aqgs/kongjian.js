
(function($, doc) {
    $.init();
    $.ready(function() {
        var _getParam = function(obj, param) {
            return obj[param] || '';
        };
        /*身高*/
        var userPicker = new $.PopPicker();
        userPicker.setData([
            {text: 155}, {text: 156}, {text: 157}, {text: 158}, {text: 159}, {text: 160}, {text: 161}, {text: 162}, {text: 163}, {text: 164},{text: 165},
            {text: 166}, {text: 167}, {text: 168}, {text: 169}, {text: 159}, {text: 170}, {text: 171}, {text: 172}, {text: 173}, {text: 174},{text: 175},
            {text: 176}, {text: 177}, {text: 178}, {text: 179}, {text: 180}, {text: 181}, {text: 182}, {text: 183}, {text: 184}, {text: 185},{text: 186},
            {text: 187}, {text: 188}, {text: 189}, {text: 190}, {text: 191}, {text: 192}, {text: 193}, {text: 194}, {text: 195}, {text: 196},{text: 197},
            {text: 198}, {text: 199}
        ]);
        var showUserPickerButton = doc.getElementById('showUserPicker');
        var userResult = doc.getElementById('showUserPicker');
        var shengao = doc.getElementById('shengao');
        showUserPickerButton.addEventListener('tap', function(event) {
            userPicker.show(function(items) {
            	shengao.value=items[0].text;
                userResult.innerText = JSON.stringify(items[0].text)+"cm";

                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);

        /*学历*/
        var userxue = new $.PopPicker();
        userxue.setData([
            {text:'高中及中专'},{text:'大专'},{text:'本科'},{text:'硕士及以上'},{text:'初中及以下'}

        ]);
        var showxue = doc.getElementById('xueli');
        var userxueli = doc.getElementById('xueli');
        var xl = doc.getElementById('xl');
        showxue.addEventListener('tap', function(event) {
            userxue.show(function(items) {
            	xl.value=items[0].text;
                userxueli.innerText = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);

        /*职务*/
        var userzw = new $.PopPicker();
        userzw.setData([
            {text:'商务'},{text:'公关'},{text:'人事'},{text:'行政'},{text:'财务'},
            {text:'法务'},{text:'工程师'},{text:'运营'},{text:'分析师'},{text:'翻译'},
            {text:'科研人员'},{text:'工互联网'}
        ]);
        var showzw = doc.getElementById('zw');
        var userzhiwu = doc.getElementById('zw');
        var zhiwu = doc.getElementById('zhiwu');
        showzw.addEventListener('tap', function(event) {
            userzw.show(function(items) {
            	zhiwu.value=items[0].text;
                userzhiwu.innerText = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);

        /*月收入*/
        var userysr = new $.PopPicker();
        userysr.setData([
            {text:'小于2k'},{text:'2k~5k'},{text:'5k~1w'},{text:'1w~2w'},{text:'2w以上'}

        ]);
        var showysr = doc.getElementById('ysr');
        var usersry = doc.getElementById('ysr');
        var shouru = doc.getElementById('shouru');
        showysr.addEventListener('tap', function(event) {
            userysr.show(function(items) {
            	shouru.value=items[0].text;
                usersry.innerText = JSON.stringify(items[0].text).replace(/\"/g, "");
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);


        /*选择居住地*/
        var cityPicker3 = new $.PopPicker({
            layer: 3
        });
        cityPicker3.setData(cityData3);
        var showCity = doc.getElementById('showCityPicker3');
        var cityResult3 = doc.getElementById('showCityPicker3');
        var juzhudi = doc.getElementById('juzhudi');
        showCity.addEventListener('tap', function(event) {
            cityPicker3.show(function(items) {
            	juzhudi.value=items[0].text+" "+items[1].text+" "+items[2].text;
                cityResult3.innerText = _getParam(items[0], 'text')+" "+  _getParam(items[1], 'text')+" "+  _getParam(items[2], 'text');
                //返回 false 可以阻止选择框的关闭
                //return false;
            });
        }, false);

    });
})(mui, document);
