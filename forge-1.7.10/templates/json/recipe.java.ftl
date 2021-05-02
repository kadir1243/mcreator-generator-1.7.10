<#-- @formatter:off -->
<#include "../mcitems.ftl">
package ${package}.item.crafting;
@Elements${JavaModName}.ModElement.Tag public class Recipe${name} extends Elements${JavaModName}.ModElement{
  @Override public void init(FMLInitializationEvent event) {
  <#if data.recipeShapeless>
    <#list data.recipeSlots as element>
        <#if !element.isEmpty()>
            <#assign ingredients += "{${element}},">
        </#if>
    </#list>
      ${ingredients[0..(ingredients?last_index_of(',') - 1)]}
			GameRegistry.addShapelessRecipe(new ItemStack(Items.${data.recipeReturnStack}), Items.iron_ingot, Items.flint);
  <#else>
    <#assign recipeArray = data.getOptimisedRecipe()>
    <#assign rm = [], i = 0>
    "key": {
    <#list rm as recipeMapping>
        ${recipeMapping}<#if recipeMapping?has_next></#if>
    </#list>
    }
  </#if>
  			GameRegistry.addShapelessRecipe(new ItemStack(${data.recipeReturnStack},${data.recipeRetstackSize}), <#list recipeArray as rl>"<#list rl as re><#if !re.isEmpty()><#assign rm+=["\"${i}\": {${re}}"]/>${i}<#else></#if><#assign i+=1></#list>"<#if rl?has_next>,</#if></#list>,Items.iron_ingot, Items.flint);
  }
}
<#-- @formatter:on -->
