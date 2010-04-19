var parser = function(expression){
  expression = expression.replace(/\s+/g, '');
  var subExpressions = expression.match(/\([0-9\*\/\+-\s\(\)]+\)/g);
  var addition = [];
  var subtraction = [];
  var multiplication = [];
  var division = [];
  
  if(subExpressions !== null)
  {
    for(var i = 0; i < subExpressions.length; i++)
    {
      expression = expression.replace(subExpressions[i], parser(subExpressions[i].substring(1, subExpressions[i].length - 1)).total());
    }
  }
  
  multiplication = expression.match(/\d+\*\d+/);
  addition = expression.match(/\d+\+\d+/);
  subtraction = expression.match(/\d+-\d+/);  
  division = expression.match(/\d+\/\d+/);
  
  var calculate = function(values){
    var total = 0;
    for(var i = 0; i < values.length; i++){
      total += eval(values[i]);
    }
    
    return total;
  }
  
  return {
    total : function(){
      var total = 0;
      
      if(multiplication !== null)
      {
        total += calculate(multiplication);
      }
      
      if(division !== null){
        total += calculate(division);
      }
      
      if(addition !== null){
        total += calculate(addition);
      }
      
      if(subtraction !== null){
        total += calculate(subtraction);
      }
      
      return total;
    }
  }
};

par = parser('(10 + 7 * (8 - 6)) * 8');
print(par.total());