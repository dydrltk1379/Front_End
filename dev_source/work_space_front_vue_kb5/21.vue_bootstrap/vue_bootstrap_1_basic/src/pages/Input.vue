<template>
    <div class="container">
        <div class="px-5">
            <h1 class="mb-3">Input 예제 - 전통적인 form 활용</h1>
            <form name="form" class="needs-validation" novalidate @submit.prevent="submit" >
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="firstName" class="form-label">First name</label>
                        <input name="firstName" type="text" class="form-control" id="firstName" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <label for="lastName" class="form-label">Last name</label>
                        <input name="lastName" type="text" class="form-control" id="lastName" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Valid last name is required.
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="email" class="form-label">Email <span
                                class="text-body-secondary"></span></label>
                        <input name="email" type="email" class="form-control" id="email" placeholder="you@example.com">
                        <div class="invalid-feedback">
                            Please enter a valid email address for shipping updates.
                        </div>
                    </div>

                    <div class="col-md-12">
                        <label for="gender" class="form-label">Gender</label>
                        <select name="gender" class="form-select" id="gender" required>
                            <option value="">Choose...</option>
                            <option>Male</option>
                            <option>Female</option>
                        </select>
                        <div class="invalid-feedback">
                            Please select a valid gender.
                        </div>
                    </div>
                    <div class="col-sm-6">
                      <button class="btn btn-primary btn-lg w-100" type="submit">Submit!</button>
                    </div>
                    <div class="col-sm-6">
                      <button class="btn btn-primary btn-lg w-100" type="reset">Clear</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</template>
<script setup>
const submit = (e)=>{
    // 정통적으로 form에서 input값 가져오는 방법!
    // formName.inputName;
    let member = {
        firstName: form.firstName.value,
        lastName: form.lastName.value,
        email: form.email.value,
        gender: form.gender.options[form.gender.selectedIndex].value,
    }
    alert('member : ' + JSON.stringify(member));
}

</script>