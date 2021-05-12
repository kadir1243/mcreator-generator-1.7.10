<#include "mcitems.ftl">
(${mappedMCItemToItemStackCode(input$item, 1)}).addEnchantment(Enchantment.${generator.map(field$enhancement, "enhancements")?lower_case},(int) ${input$level});
