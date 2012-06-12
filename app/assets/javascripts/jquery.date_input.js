/*
Date Input 1.2.1
Requires jQuery version: >= 1.2.6

Copyright (c) 2007-2008 Jonathan Leighton & Torchbox Ltd

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/
DateInput = (function() { 

function DateInput(el, opts) {
  if (typeof(opts) != "object") opts = {};
  $.extend(this, DateInput.DEFAULT_OPTS, opts);
  
  this.input = $(el);
  this.bindMethodsToObj("show", "hide", "hideIfClickOutside", "keydownHandler", "selectDate");
  
  this.build();
  this.selectDate();
  this.hide();
};
DateInput.DEFAULT_OPTS = {
  month_names: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
  short_month_names: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
  short_day_names: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
  start_of_week: 1
};
DateInput.prototype = {
  build: function() {
    var monthNav = $('<p class="month_nav">' +
      '<span class="button prev" title="[Page-Up]">&#171;</span>' +
      ' <span class="month_name"></span> ' +
      '<span class="button next" title="[Page-Down]">&#187;</span>' +
      '</p>');
    this.monthNameSpan = $(".month_name", monthNav);
    $(".prev", monthNav).click(this.bindToObj(function() { this.moveMonthBy(-1); }));
    $(".next", monthNav).click(this.bindToObj(function() { this.moveMonthBy(1); }));
    
    var yearNav = $('<p class="year_nav">' +
      '<span class="button prev" title="[Ctrl+Page-Up]">&#171;</span>' +
      ' <span class="year_name"></span> ' +
      '<span class="button next" title="[Ctrl+Page-Down]">&#187;</span>' +
      '</p>');
    this.yearNameSpan = $(".year_name", yearNav);
    $(".prev", yearNav).click(this.bindToObj(function() { this.moveMonthBy(-12); }));
    $(".next", yearNav).click(this.bindToObj(function() { this.moveMonthBy(12); }));
    
    var nav = $('<div class="nav"></div>').append(monthNav, yearNav);
    
    var tableShell = "<table><thead><tr>";
    $(this.adjustDays(this.short_day_names)).each(function() {
      tableShell += "<th><div class='short_names'>" + this + "</div></th>";
    });
    tableShell += "</tr></thead><tbody></tbody></table>";
    
    this.dateSelector = this.rootLayers = $('<div class="date_selector"></div>').append(nav, tableShell).insertAfter(this.input);
    
    if ($.browser.msie && $.browser.version < 7) {
      
      this.ieframe = $('<iframe class="date_selector_ieframe" frameborder="0" src="#"></iframe>').insertBefore(this.dateSelector);
      this.rootLayers = this.rootLayers.add(this.ieframe);
      
      $(".button", nav).mouseover(function() { $(this).addClass("hover") });
      $(".button", nav).mouseout(function() { $(this).removeClass("hover") });
    };
    
    this.tbody = $("tbody", this.dateSelector);
    
    this.input.change(this.bindToObj(function() { this.selectDate(); }));
    this.selectDate();
  },

  selectMonth: function(date) {
    var newMonth = new Date(date.getFullYear(), date.getMonth(), 1);
    
    if (!this.currentMonth || !(this.currentMonth.getFullYear() == newMonth.getFullYear() &&
                                this.currentMonth.getMonth() == newMonth.getMonth())) {
      
      this.currentMonth = newMonth;
      
      var rangeStart = this.rangeStart(date), rangeEnd = this.rangeEnd(date);
      var numDays = this.daysBetween(rangeStart, rangeEnd);
      var dayCells = "";
      
      for (var i = 0; i <= numDays; i++) {
        var currentDay = new Date(rangeStart.getFullYear(), rangeStart.getMonth(), rangeStart.getDate() + i, 12, 00);
        //currentDay.setMonth(6);
		//currentDay.setDate(6);
        if (this.isFirstDayOfWeek(currentDay)) dayCells += "<tr>";
        
        if (currentDay.getMonth() == date.getMonth()) {
			if(i==5 || i==6 || i==12 || i==13 || i==19 || i==20 || i==26 || i==27 || i==33 || i==34)
			{
				dayCells += '<td class="holiday" date="' + this.dateToString(currentDay) + '">' + currentDay.getDate() + '</td>';
			}
			/*else if(currentDay.getDate()>10 && currentDay.getDate()<20)
			{
				dayCells += '<td class="unselected_month" date="' + this.dateToString(currentDay) + '">' + currentDay.getDate() + '</td>';
			}*/
			else
			{
			dayCells += '<td class="selectable_day" date="' + this.dateToString(currentDay) + '">' + currentDay.getDate() + '</td>';
		  }
        } else {
		
          dayCells += '<td class="unselected_month" date="' + this.dateToString(currentDay) + '">' + currentDay.getDate() + '</td>';
        };
        
        if (this.isLastDayOfWeek(currentDay)) dayCells += "</tr>";
      };
      this.tbody.empty().append(dayCells);
      
      this.monthNameSpan.empty().append(this.monthName(date));
      this.yearNameSpan.empty().append(this.currentMonth.getFullYear());
      
      $(".selectable_day", this.tbody).click(this.bindToObj(function(event) {
        this.changeInput($(event.target).attr("date"));
      }));
	  $(".holiday", this.tbody).click(this.bindToObj(function(event) {
        this.changeInput($(event.target).attr("date"));
      }));
      
      $("td[date=" + (this.dateToString(new Date())) + "]", this.tbody).addClass("today");
      
      $("td.selectable_day", this.tbody).mouseover(function() { $(this).addClass("hover") });
      $("td.selectable_day", this.tbody).mouseout(function() { $(this).removeClass("hover") });
	  $("td.holiday", this.tbody).mouseover(function() { $(this).addClass("hover") });
      $("td.holiday", this.tbody).mouseout(function() { $(this).removeClass("hover") });
    };
    
    $('.selected', this.tbody).removeClass("selected");
    $('td[date=' + this.selectedDateString + ']', this.tbody).addClass("selected");
  },
  
  selectDate: function(date) {

    if (typeof(date) == "undefined") {
      date = this.stringToDate(this.input.val());

    };
    if (!date) date = new Date();

    this.selectedDate = date;

	//select1=this.selectedDate-3;
    this.selectedDateString = this.dateToString(this.selectedDate);//alert(this.selectedDateString);
    this.selectMonth(this.selectedDate);
  },
  
  changeInput: function(dateString) {
    this.input.val(dateString).change();
    this.hide();
  },
  
  show: function() {
    this.rootLayers.css("display", "block");
    $([window, document.body]).click(this.hideIfClickOutside);
    this.input.unbind("focus", this.show);
    $(document.body).keydown(this.keydownHandler);
    this.setPosition();
  },
  
  hide: function() {
    this.rootLayers.css("display", "none");
    $([window, document.body]).unbind("click", this.hideIfClickOutside);
    this.input.focus(this.show);
    $(document.body).unbind("keydown", this.keydownHandler);
  },
  
  hideIfClickOutside: function(event) {
    if (event.target != this.input[0] && !this.insideSelector(event)) {
      this.hide();
    };
  },
  
  insideSelector: function(event) {
    var offset = this.dateSelector.position();
    offset.right = offset.left + this.dateSelector.outerWidth();
    offset.bottom = offset.top + this.dateSelector.outerHeight();
    
    return event.pageY < offset.bottom &&
           event.pageY > offset.top &&
           event.pageX < offset.right &&
           event.pageX > offset.left;
  },
  
  keydownHandler: function(event) {
    switch (event.keyCode)
    {
      case 9: 
      case 27: 
        this.hide();
        return;
      break;
      case 13: 
        this.changeInput(this.selectedDateString);
      break;
      case 33: 
        this.moveDateMonthBy(event.ctrlKey ? -12 : -1);
      break;
      case 34: 
        this.moveDateMonthBy(event.ctrlKey ? 12 : 1);
      break;
      case 38: 
        this.moveDateBy(-7);
      break;
      case 40: 
        this.moveDateBy(7);
      break;
      case 37: 
        this.moveDateBy(-1);
      break;
      case 39: 
        this.moveDateBy(1);
      break;
      default:
        return;
    }
    event.preventDefault();
  },

    stringToDate: function(string) {
        format=$("#date_format").val();
        var matches;
        if(format === "%d/%m/%Y")
        {
            //alert(string);
            if (matches = string.match(/^(\d{2,2})\/(\d{2,2})\/(\d{4,4})$/)) {         // dd/mm/yyyy   1
                //alert(matches[3]+"-"+(matches[2]) +"-"+ matches[1]);
                return new Date(matches[3], matches[2]-1,matches[1]);
            } else {
              return null;
            }
        }
        if (format == "%d-%m-%Y")
        {
            if (matches = string.match(/^(\d{2,2})-(\d{2,2})-(\d{4,4})$/)) {         // dd-mm-yyyy    2
              return new Date(matches[3], matches[2]-1,matches[1]);
            } else {
              return null;
            }
        }
        if (format == "%m/%d/%Y")
        {
            if (matches = string.match(/^(\d{2,2})\/(\d{2,2})\/(\d{4,4})$/)) {         // mm/dd/yyyy  3
                return new Date(matches[3], matches[1]-1,matches[2]);
            } else {
              return null;
            }
        }
        if (format == "%m-%d-%Y")
        {
            if (matches = string.match(/^(\d{2,2})-(\d{2,2})-(\d{4,4})$/)) {         // mm-dd-yyyy     4
                return new Date(matches[3], matches[1]-1,matches[2]);
            } else {
              return null;
            }
        }
        if (format === "%Y/%m/%d")
        {
            if (matches = string.match(/^(\d{4,4})\/(\d{2,2})\/(\d{2,2})$/)) {       // yyyy/mm/dd     5
                return new Date(matches[1], matches[2] - 1, matches[3]);
            } else {
                return null;
            }
        }
        if (format === "%Y-%m-%d")
        {
            if (matches = string.match(/^(\d{4,4})-(\d{2,2})-(\d{2,2})$/)) {       // yyyy-mm-dd        6
                return new Date(matches[1], matches[2] - 1, matches[3]);
            } else {
                return null;
            }
        }
        if (format === "%b/%d/%Y")
        {
            if (matches = string.match(/^([^\s]+)\/(\d{2,2})\/(\d{4,4})$/)) {       // mon/dd/yyyy     7
              return new Date(matches[3],this.shortMonthNum(matches[1]),matches[2]);
            } else {
              return null;
            }
        }
        if (format === "%b-%d-%Y")
        {
            if (matches = string.match(/^([^\s]+)-(\d{2,2})-(\d{4,4})$/)) {        //  mon-dd-yyyy     8
              return new Date(matches[3],this.shortMonthNum(matches[1]),matches[2]);
            } else {
              return null;
            }
        }
        if (format === "%d/%b/%Y")
        {
            if (matches = string.match(/^(\d{2,2})\/([^\s]+)\/(\d{4,4})$/)) {     //  dd/mon/yyyy     9
              return new Date(matches[3], this.shortMonthNum(matches[2]), matches[1]);
            } else {
              return null;
            }
        }
        if (format === "%d-%b-%Y")
        {
            if (matches = string.match(/^(\d{2,2})-([^\s]+)-(\d{4,4})$/)) {     //  dd/mon/yyyy     10
              return new Date(matches[3], this.shortMonthNum(matches[2]), matches[1]);
            } else {
              return null;
            }
        }
        if (format === "%Y/%b/%d")
        {
            if (matches = string.match(/^(\d{4,4})\/([^\s]+)\/(\d{2,2})$/)) {   //  yyyy/mon/dd     11
              return new Date(matches[1], this.shortMonthNum(matches[2]), matches[3]);
            } else {
              return null;
            }
        }
        if (format === "%Y-%b-%d")
        {
            if (matches = string.match(/^(\d{4,4})-([^\s]+)-(\d{2,2})$/)) {    //  yyyy-mon-dd      12
              return new Date(matches[1], this.shortMonthNum(matches[2]), matches[3]);
            } else {
              return null;
            }
        }
        if (format === "%B %d, %Y")
        {
            if (matches = string.match(/^([^\s]+) (\d{2,2}), (\d{4,4})$/)) {       // month dd, yyyy    13
              return new Date(matches[3],this.monthNum(matches[1]),matches[2]);
            } else {
              return null;
            }
        }
        if (format === "%d %B %Y")
        {
            if (matches = string.match(/^(\d{2,2}) ([^\s]+) (\d{4,4})$/)) {       //  dd month yyyy    14
              return new Date(matches[3], this.monthNum(matches[2]), matches[1]);
            } else {
              return null;
            }
        }
        if (format === "")
        {
            if (matches = string.match(/^(\d{4,4})-(\d{2,2})-(\d{2,2})$/)) {       // yyyy-mm-dd        0
                return new Date(matches[1], matches[2] - 1, matches[3]);
            } else {
                return null;
            }
        }
        if (format === "%m-%Y-%d")
        {
            if (matches = string.match(/^(\d{2,2})-(\d{4,4})-(\d{2,2})$/)) {     //  mm-yyyy-dd      15
              return new Date(matches[2], matches[1]-1,matches[3]);
            } else {
              return null;
            }
        }
        if (format === "%d/%m/%y" )
        {
            if (matches = string.match(/^(\d{2,2})\/(\d{2,2})\/(\d{2,2})$/)) {   //  dd/mm/yy        16
                var year_value=this.convertYear(matches[3]);
              return new Date(year_value, matches[2]-1,matches[1]);
            } else {
              return null;
            };
        }
        if (format === "%d-%m-%y" )
        {
            if (matches = string.match(/^(\d{2,2})-(\d{2,2})-(\d{2,2})$/)) {   //  dd-mm-yy        17
                var year_value=this.convertYear(matches[3]);
              return new Date(year_value, matches[2]-1,matches[1]);
            } else {
              return null;
            };
        }

      },

      dateToString: function(date) {
          format=$("#date_format").val();
        var month = (date.getMonth() + 1).toString();
        var dom = date.getDate().toString();
        var yr= date.getFullYear().toString();
        var year = yr.slice(2);
        if (month.length == 1) month = "0" + month;
        if (dom.length == 1) dom = "0" + dom;
        if (format === "%d/%m/%Y")
        {
            return  dom + "/" + month + "/" + date.getFullYear();
        }
        if (format === "%d-%m-%Y")
        {
            return  dom + "-" + month + "-" + date.getFullYear();
        }
        if (format === "%m/%d/%Y")
        {
            return  month + "/" + dom + "/" + date.getFullYear();
        }
        if (format === "%m-%d-%Y")
        {
            return  month + "-" + dom + "-" + date.getFullYear();
        }
        if (format === "%Y/%m/%d")
        {
            return date.getFullYear() + "/" + month + "/" + dom;
        }
        if (format === "%Y-%m-%d" || format == "")
        {
            return date.getFullYear() + "-" + month + "-" + dom;
        }
        if (format === "%b/%d/%Y")
        {
            return this.short_month_names[date.getMonth()] + "/" + dom + "/" + date.getFullYear();
        }
        if (format === "%b-%d-%Y")
        {
            return this.short_month_names[date.getMonth()] + "-" + dom + "-" + date.getFullYear();
        }
        if (format === "%d/%b/%Y")
        {
            return dom + "/" + this.short_month_names[date.getMonth()] + "/" + date.getFullYear();
        }
        if (format === "%d-%b-%Y")
        {
            return dom + "-" + this.short_month_names[date.getMonth()] + "-" + date.getFullYear();
        }
        if (format === "%Y/%b/%d")
        {
            return date.getFullYear() + "/" + this.short_month_names[date.getMonth()] + "/" + dom;
        }
        if (format === "%Y-%b-%d")
        {
            return date.getFullYear() + "-" + this.short_month_names[date.getMonth()] + "-" + dom;
        }
        if (format === "%B %d, %Y")
        {
            return this.month_names[date.getMonth()] + " " + dom + ", " + date.getFullYear();
        }
        if (format === "%d %B %Y")
        {
            return dom + " " + this.month_names[date.getMonth()] + " " + date.getFullYear();
        }
        if (format === "%m-%Y-%d")
        {
            return  month + "-" + date.getFullYear() + "-" + dom;
        }
        if (format === "%d/%m/%y")
        {
            return  dom + "/" + month + "/" + year;
        }
        if (format === "%d-%m-%y")
        {
            return  dom + "-" + month + "-" + year;
        }
      },

    convertYear : function(yr)
      {
        var dyear="";
        if(yr<=68)
        {
            dyear="20"+yr;
        }
        if(yr>68)
        {
            dyear="19"+yr;
        }
        return dyear;
      },

  setPosition: function() {
    var offset = this.input.offset();
    this.rootLayers.css({
      top: offset.top + this.input.outerHeight(),
      left: offset.left
    });
    
    if (this.ieframe) {
      this.ieframe.css({
        width: this.dateSelector.outerWidth(),
        height: this.dateSelector.outerHeight()
      });
    };
  },
  
  moveDateBy: function(amount) {
    var newDate = new Date(this.selectedDate.getFullYear(), this.selectedDate.getMonth(), this.selectedDate.getDate() + amount);
    this.selectDate(newDate);
  },
  
  moveDateMonthBy: function(amount) {
    var newDate = new Date(this.selectedDate.getFullYear(), this.selectedDate.getMonth() + amount, this.selectedDate.getDate());
    if (newDate.getMonth() == this.selectedDate.getMonth() + amount + 1) {
      
      newDate.setDate(0);
    };
    this.selectDate(newDate);
  },
  
  moveMonthBy: function(amount) {
    var newMonth = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth() + amount, this.currentMonth.getDate());
    this.selectMonth(newMonth);
  },
  
  monthName: function(date) {
    return this.month_names[date.getMonth()];
  },
  
  bindToObj: function(fn) {
    var self = this;
    return function() { return fn.apply(self, arguments) };
  },
  
  bindMethodsToObj: function() {
    for (var i = 0; i < arguments.length; i++) {
      this[arguments[i]] = this.bindToObj(this[arguments[i]]);
    };
  },
  
  indexFor: function(array, value) {
    for (var i = 0; i < array.length; i++) {
      if (value == array[i]) return i;
    };
  },
  
  monthNum: function(month_name) {
    return this.indexFor(this.month_names, month_name);
  },
  
  shortMonthNum: function(month_name) {
    return this.indexFor(this.short_month_names, month_name);
  },
  
  shortDayNum: function(day_name) {
    return this.indexFor(this.short_day_names, day_name);
  },
  
  daysBetween: function(start, end) {
    start = Date.UTC(start.getFullYear(), start.getMonth(), start.getDate());
    end = Date.UTC(end.getFullYear(), end.getMonth(), end.getDate());
    return (end - start) / 86400000;
  },
  
  changeDayTo: function(dayOfWeek, date, direction) {
    var difference = direction * (Math.abs(date.getDay() - dayOfWeek - (direction * 7)) % 7);
    return new Date(date.getFullYear(), date.getMonth(), date.getDate() + difference);
	//return new Date(date.getFullYear(), date.getMonth(), date.getDate() + difference);
	
  },
  
  rangeStart: function(date) {
    return this.changeDayTo(this.start_of_week, new Date(date.getFullYear(), date.getMonth()), -1);
  },
  
  rangeEnd: function(date) {
    return this.changeDayTo((this.start_of_week - 1) % 7, new Date(date.getFullYear(), date.getMonth() + 1, 0), 1);
  },
  
  isFirstDayOfWeek: function(date) {
    return date.getDay() == this.start_of_week;
  },
  
  isLastDayOfWeek: function(date){
    return date.getDay() == (this.start_of_week - 1) % 7;
  },
  
  adjustDays: function(days) {
    var newDays = [];
    for (var i = 0; i < days.length; i++) {
      newDays[i] = days[(i + this.start_of_week) % 7];
    };
    return newDays;
  }
};

$.fn.date_input = function(opts) {
    this.date_format = $("#date_format").val();
    return this.each(function() { new DateInput(this, opts); });
};
$.date_input = { initialize: function(opts) {
  $("input.date_input").date_input(opts);
  $("input.date_input1").date_input(opts);
  $("input.date_input2").date_input(opts);
  $("input.date_input3").date_input(opts);
  $("input.date_input4").date_input(opts);
  $("input.date_input5").date_input(opts);
  $("input.date_input6").date_input(opts);
  $("input.date_input7").date_input(opts);

} };

return DateInput;
})(jQuery);