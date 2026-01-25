// File for Dates

// Import Modules
pragma Singleton
import Quickshell

// Main Config
Singleton {
  id: root

  function FirstDayOfTheWeek(date, firstDay = 1) {
    const d = new Date(date);
    const day = d.getDay(); // 0 = Sunday, 1 = Monday, ..., 6 = Saturday

    // Calculate Difference to firstDay
    const diff = (day - firstDay + 7) % 7;
    d.setDate(d.getDate() - diff);
    return d;
  }

  function sameDate(d1, d2) {
    return (d1.getFullYear() === d2.getFullYear() && d1.getMonth() === d2.getMonth() && d1.getDate() === d2.getDate());
  }

  function getDayDateOfSameWeek(date, i, firstDay = 0) {
    const firstDayDate = root.getFirstDayOfTheWeek(date, firstDay);
    const targetData = new Date(firstDayDate);
    targetDate.setDate(firstDayDate.getDate() + i);
    return targetDate();
  }
}
