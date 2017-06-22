
function alter_div_id(){
  var myElem = document.getElementById('test');
  if (myElem === null) alert('div with id test is not loaded yet');

  var chart = dc.pieChart("#test");
  var data          = [ 
    { 'Expt': 1, 'Run': 1, 'Speed': 850, 'title': 'Greece'  }, 
    { 'Expt': 1, 'Run': 2, 'Speed': 1000, 'title': 'Italy'  }, 
    { 'Expt': 1, 'Run': 3,  'Speed': 900, 'title': 'Germany' }, 
      { 'Expt': 1, 'Run': 1, 'Speed': 850, 'title': 'Greece'  }, 
    { 'Expt': 1, 'Run': 2, 'Speed': 1000, 'title': 'dfsffdf'  }, 
    { 'Expt': 1, 'Run': 3,  'Speed': 900, 'title': 'dfd' }, 
    { 'Expt': 1, 'Run': 3,  'Speed': 900, 'title': 'ewre' }, 
    { 'Expt': 1, 'Run': 3,  'Speed': 900, 'title': 'dfdfdg' }, 
    { 'Expt': 1, 'Run': 4, 'Speed': 1070, 'title': 'fdfd' }
  ];
  var ndx           = crossfilter(data),
      runDimension  = ndx.dimension(function(d) {
	return d.title;
      });
      speedSumGroup = runDimension.group().reduceSum(function(d) { 
	console.log(d); return d.Speed * d.Run;
      });

    chart
      .width(368)
      .height(380)
      .slicesCap(10)
      .innerRadius(10)
      .dimension(runDimension)
      .group(speedSumGroup) // by default, pie charts will use group.key as the label
      .renderLabel(true)
      .label(function (d) {
	console.log('label');
	console.log(d);
	return d.key.toUpperCase();
      });

    chart.render();
  
  var chart1 = dc.pieChart("#test1");
  var data          = [ 
   
    { 'Expt': 1, 'Run': 2, 'Speed': 740, 'title': 'USA'  }, 
    { 'Expt': 1, 'Run': 3,  'Speed': 900, 'title': 'NOR' }, 
    { 'Expt': 1, 'Run': 4, 'Speed': 1070, 'title': 'PORTUGAL' }
  ];
  var ndx           = crossfilter(data),
      runDimension  = ndx.dimension(function(d) {
	return d.title;
      });
      speedSumGroup = runDimension.group().reduceSum(function(d) { 
	console.log(d); return d.Speed * d.Run;
      });

    chart1
      .width(368)
      .height(380)
      .slicesCap(4)
      .innerRadius(5)
      .dimension(runDimension)
      .group(speedSumGroup) // by default, pie charts will use group.key as the label
      .renderLabel(true)
      .label(function (d) {
	console.log('label');
	console.log(d);
	return d.key.toUpperCase();
      });

    chart1.render();
}
