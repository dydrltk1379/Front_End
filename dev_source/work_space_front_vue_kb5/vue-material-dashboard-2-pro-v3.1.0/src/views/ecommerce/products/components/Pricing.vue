<template>
  <div
    class="pt-3 bg-white multisteps-form__panel border-radius-xl"
    data-animation="FadeIn"
  >
    <h5 class="font-weight-bolder">Pricing</h5>
    <div class="mt-3 multisteps-form__content">
      <div class="row">
        <div class="col-3">
          <material-input id="price" variant="dynamic" label="Price" />
        </div>
        <div class="col-4">
          <select
            id="choices-currency"
            class="form-control"
            name="choices-sizes"
          >
            <option value="Choice 1" selected>USD</option>
            <option value="Choice 2">EUR</option>
            <option value="Choice 3">GBP</option>
            <option value="Choice 4">CNY</option>
            <option value="Choice 5">INR</option>
            <option value="Choice 6">BTC</option>
          </select>
        </div>
        <div class="col-5">
          <material-input id="currency" variant="dynamic" label="SKU" />
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <label class="mt-4 ms-0 form-label">Tags</label>
          <select
            id="choices-tags"
            class="form-control"
            name="choices-tags"
            multiple
          >
            <option value="Choice 1" selected>In Stock</option>
            <option value="Choice 2">Out of Stock</option>
            <option value="Choice 3">Sale</option>
            <option value="Choice 4">Black Friday</option>
          </select>
        </div>
      </div>
      <div class="mt-4 button-row d-flex col-12">
        <material-button
          type="button"
          color="secondary"
          variant="gradient"
          class="mb-0 js-btn-prev"
          title="Prev"
          @click="$parent.prevStep"
          >Prev</material-button
        >
        <material-button
          type="button"
          color="dark"
          variant="gradient"
          class="mb-0 ms-auto js-btn-next"
          title="Next"
          >Next</material-button
        >
      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable prettier/prettier */
import Choices from "choices.js";
import MaterialButton from "@/components/MaterialButton.vue";
import MaterialInput from "@/components/MaterialInput.vue";

export default {
  name: "Pricing",
  components: {
    MaterialButton,
    MaterialInput,
  },
  mounted() {
    if (document.getElementById("choices-currency")) {
      let element = document.getElementById("choices-currency");
      new Choices(element, {
        searchEnabled: false,
        allowHTML: true,
      });
    }

    if (document.getElementById("choices-tags")) {
      var tags = document.getElementById("choices-tags");
      const examples = new Choices(tags, {
        removeItemButton: true,
        allowHTML: true,
      });

      examples.setChoices(
        [
          {
            value: "One",
            label: "Expired",
            disabled: true,
          },
          {
            value: "Two",
            label: "Out of Stock",
            selected: true,
          },
        ],
        "value",
        "label",
        false
      );
    }
  },
};
</script>
