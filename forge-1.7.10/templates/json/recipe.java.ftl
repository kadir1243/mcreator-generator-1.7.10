<#include "../mcitems.ftl">
package ${package}.item.crafting;
@Elements${JavaModName}.ModElement.Tag public class Recipe${name} extends Elements${JavaModName}.ModElement{
  @Override public void init(FMLInitializationEvent event) {
  <#if data.recipeShapeless>
    <#list data.recipeSlots as element>
        <#if !element.isEmpty()>
            <#assign ingredients += "{${mappedMCItemToIngameItemName(element)}},">
        </#if>
    </#list>
      ${ingredients[0..(ingredients?last_index_of(',') - 1)]}
			GameRegistry.addShapelessRecipe(new ItemStack(Items.${mappedMCItemToIngameItemName(data.recipeReturnStack)}), Items.iron_ingot, Items.flint);
  <#else>
  "type": "minecraft:crafting_shaped",
    <#assign recipeArray = data.getOptimisedRecipe()>
    <#assign rm = [], i = 0>
    "pattern": [
    <#list recipeArray as rl>
			"<#list rl as re><#if !re.isEmpty()><#assign rm+=["\"${i}\": {${mappedMCItemToIngameItemName(re)}}"]/>${i}<#else> </#if><#assign i+=1></#list>"<#if rl?has_next>,</#if>
    </#list>
    ],
    "key": {
    <#list rm as recipeMapping>
        ${recipeMapping}<#if recipeMapping?has_next>,</#if>
    </#list>
    },
  </#if>
    "result": {
        ${mappedMCItemToIngameItemName(data.recipeReturnStack)},
    "count": ${data.recipeRetstackSize}}
  }
}