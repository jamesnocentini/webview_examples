var margin = {top: 50, right: 20, bottom: 10, left: 20};
var w = 550;
var h = 300;

var dataset = [
  {
    start_date: '2014-01-01',
    end_date: '2014-01-15'
  },
  {
    start_date: '2014-02-01',
    end_date: '2014-03-30'
  }
];

var format = d3.time.format("%Y-%m-%d");

var colors = d3.scale.category10();

var xScale = d3.time.scale()
  .domain([new Date, new Date])
  .nice(d3.time.year)
  .range([0, w]);

function reloadTimeline(i) {

  var group = d3.select('#rect-group');

  var rects = group.selectAll('rect')
    .data(dataset);

  rects.enter()
    .append('rect')
    .attr('width', 0);

  rects
    .exit()
    .transition()
    .duration(1000)
    .attr('width', 0)
    .remove();

  rects
    .transition()
    .duration(1000)
    .attr('width', function(d) {
      return xScale(format.parse(d.end_date)) - xScale(format.parse(d.start_date));
    });

  rects
    .attr('y', -22)
    .attr('x', function(d) { return xScale(format.parse(d.start_date)); })
    .attr('height', 20)
    .style('fill', function(d, i) {
      return colors(i);
    });

}

function init() {

  var svg = d3.select('pricing-timeline').append('svg')
    .attr('width', w + margin.left + margin.right)
    .attr('height', h + margin.top + margin.bottom)
    .append('g')
    .attr('transform', 'translate(' + margin.left + ',' + margin.top + ')');

  svg.append('g')
    .attr('class', 'x axis')
    .call(d3.svg.axis().scale(xScale).orient('bottom'));


  svg.append('g')
    .attr('id', 'rect-group');

  reloadTimeline(1);
}

init();