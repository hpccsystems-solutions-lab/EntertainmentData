IMPORT $;
EXPORT YearsOld(integer4 datex) := (INTEGER4) IF($.IsValidYear(datex),
                                                ($.ThisYear - datex),
                                                 datex);
