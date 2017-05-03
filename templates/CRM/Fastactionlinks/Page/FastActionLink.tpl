{if $action eq 1 or $action eq 2 or $action eq 4}
  FIXME: Create a form for editing FALs.
  {include file=""}
{else}
  {if $fastActionLink}
    {debug}
    <div id="fal_page">
      {strip}
        {* handle enable/disable actions*}
        {include file="CRM/common/enableDisableApi.tpl"}
        <table id="options" class="row-highlight">
          <thead>
            <tr>
              <th>{ts}Link Label{/ts}</th>
              <th>{ts}Profile{/ts}</th>
              <th>{ts}Field Type{/ts}</th>
              <th>{ts}Order{/ts}</th>
              <th>{ts}Dim on Use{/ts}</th>
              <th>{ts}Confirm{/ts}</th>
              <th>{ts}Enabled{/ts}</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$fastActionLink item=row}
              <tr id="FastActionLink-{$row.id}" class="crm-entity {cycle values="odd-row,even-row"}{if NOT $row.is_active} disabled{/if}">
                <td class="crm-editable crmf-label" data-field="label">{$row.label}</td>
                <td>{$row.uf_group_id}</td>
                <td>{$row.html_type}</td>
                <td class="nowrap">{$row.weight}</td>
                <td class="crm-editable" data-type="boolean" data-field="dim_on_use">{if $row.dim_on_use eq 1} {ts}Yes{/ts} {else} {ts}No{/ts} {/if}</td>
                <td class="crm-editable" data-type="boolean" data-field="confirm">{if $row.confirm eq 1} {ts}Yes{/ts} {else} {ts}No{/ts} {/if}</td>
                <td>{if $row.is_active eq 1} {ts}Yes{/ts} {else} {ts}No{/ts} {/if}</td>
                <td>{$row.actionLinks|replace:'xx':$row.id}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      {/strip}

    </div>

  {else}
    {if $action eq 16}
      <div class="messages status no-popup crm-empty-table">
        <img src="{$config->resourceBase}i/Inform.gif" alt="{ts}status{/ts}"/>
        {ts}None found.{/ts}
      </div>
    {/if}
  {/if}
  <div class="action-link">
    {crmButton p='civicrm/fastactionlink/add' q="reset=1&action=add" id="newFastActionLink"  class="action-item" icon="plus-circle"}{ts}Add Fast Action Link{/ts}{/crmButton}
  </div>
{/if}


{* Example: Display a translated string -- which happens to include a variable *}
<p>{ts 1=$action}The current action is %1.{/ts}</p>
