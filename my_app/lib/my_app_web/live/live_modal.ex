defmodule MyAppWeb.LiveHelpers.LiveModal do
  use Surface.LiveComponent

  alias Phoenix.LiveView.JS
  alias Surface.Components.{LivePatch, Raw}
  alias MyAppWeb.LiveHelpers.LiveModal

  prop return_to, :string
  prop opts, :keyword

  slot default

  @doc """
  Renders a live component inside a modal.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <.modal return_to={Routes.contact_index_path(@socket, :index)}>
        <.live_component
          module={MyAppWeb.ContactLive.FormComponent}
          id={@contact.id || :new}
          title={@page_title}
          action={@live_action}
          return_to={Routes.contact_index_path(@socket, :index)}
          contact: @contact
        />
      </.modal>
  """
  def render(assigns) do
    ~F"""
    <div id="modal" class="phx-modal fade-in" phx-remove={hide_modal()}>
      <div
        id="modal-content"
        class="phx-modal-content fade-in-scale"
        phx-click-away={JS.dispatch("click", to: "#close")}
        phx-window-keydown={JS.dispatch("click", to: "#close")}
        phx-key="escape"
      >
        {#if @return_to}
          <LivePatch
            to={@return_to}
            class="phx-modal-close"
          >
          <#Raw>
            &times;
          </#Raw>
          </LivePatch>
        {#else}
         <a id="close" href="#" class="phx-modal-close" phx-click={hide_modal()}>✖</a>
        {/if}

        <#slot />
      </div>
    </div>
    """
  end

  def hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(to: "#modal", transition: "fade-out")
    |> JS.hide(to: "#modal-content", transition: "fade-out-scale")
  end
end
