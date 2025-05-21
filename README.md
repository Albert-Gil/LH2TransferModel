
# LH₂ Transfer Model

This repository contains a set of MATLAB scripts developed to simulate **liquid hydrogen (LH₂) transfer processes** in refueling stations. The model supports the design and analysis of LH₂ operations for **heavy-duty vehicle fueling**, with a focus on minimizing venting and optimizing thermal behavior.

The model and its results are formally presented in the following peer-reviewed publication:

> **Gil, A., Flores, R., Brouwer, J.**  
> *Modeling and improving liquid hydrogen transfer processes*,  
> **Applied Energy**, Volume 390, 2025, 125779.  
> https://doi.org/10.1016/j.apenergy.2025.125779

---

## 📌 Objective

This simulation tool is designed to:
- Simulate LH₂ transfer between cryogenic tanks (e.g., trailer to station, or station to onboard).
- Track **boil-off gas (BOG)** generation and **venting** during transfer.
- Compare driving strategies:  **pressurization** vs. **pump-driven** transfer.
- Evaluate key process parameters including **flow rate**, **inlet temperature**, and **cooling strategies**.

---

## 🧠 Model Description

- The model is a **0D, lumped-parameter thermodynamic model**.
- It performs transient mass and energy balances on both the liquid and vapor phases of LH₂.
- Key features include:
  - Environmental heat ingress through the tank walls
  - Liquid-vapor thermal stratification
  - Phase change and venting dynamics
  - Transfer control logic

### 🔬 Scientific Foundations

This model is built upon and extends the methodology developed by:

> **Petitpas, G., Aceves, S., Morris, J. et al.**  
> *Modeling of liquid hydrogen boil-off in cryogenic pressure vessels*,  
> **International Journal of Hydrogen Energy**, Volume 44, Issue 3, 2019, pp. 1943–1953.  
> https://doi.org/10.1016/j.ijhydene.2018.11.080

The original framework was adapted to simulate dynamic refueling conditions and extended to include pump-driven transfer and top-fill strategies.

### ⚙️ Thermodynamic Properties

- All fluid properties are computed using **NIST's REFPROP** package.
- A valid REFPROP license is required.  
  More info: https://www.nist.gov/srd/refprop

---

## 🧰 Repository Contents

### 🔁 Main Scripts
- `MAIN.m` – Entry point to run simulations.
- `LH2Simulate.m` / `LH2Simulate_Pump.m` – Pressure-based or pump-based transfer.
- `LH2Control.m` / `LH2Control_pump.m` – Control logic for start, stop, and venting.

### 📄 Parameter Files
- Predefined transfer cases (e.g., `TrailerToMain`, `MainToOnboard`) with adjustable inputs.

### 📊 Post-Processing & Utilities
- `plotLH2Data.m` – Visualization of results.
- `Data_extraction.m`, `SaveResultsFunction.m` – Data management tools.
- `CreateXLSTXT.m`, `UpdateXLSLog.m` – Optional Excel log generation.

### 🧩 Helper Functions
- Thermophysical: `vaporpressure.m`, `gasFlow.m`, `cylVToH.m`
- UI: `waitbartime.m`

---

## ▶️ How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/Albert-Gil/LH2TransferModel.git
   cd LH2TransferModel
   ```

2. Install and configure **NIST REFPROP**.

3. Open MATLAB, set the folder as working directory, and run:
   ```matlab
   MAIN
   ```

You can modify parameter files to define your desired scenario.

---

## 📈 Outputs

- Time series for:
  - Liquid and vapor temperature
  - Tank pressure
  - Boil-off rate and vented mass
- Exported results and plots for further analysis

---

## 📜 References

If you use this model, please cite both:

**1.**  
> **Gil, A., Flores, R., Brouwer, J.**  
> *Modeling and improving liquid hydrogen transfer processes*,  
> **Applied Energy**, Volume 390, 2025, 125779.  
> https://doi.org/10.1016/j.apenergy.2025.125779

**2.**  
> **Petitpas, G. et al.**  
> *Modeling of liquid hydrogen boil-off in cryogenic pressure vessels*,  
> International Journal of Hydrogen Energy, 44(3), 2019, pp. 1943–1953.  
> https://doi.org/10.1016/j.ijhydene.2018.11.080

---

## ⚠️ Notes

- This repository is intended for academic and research use.
- **REFPROP license required.**
- This repository **may not be regularly maintained or updated.**
- No warranty is provided. Use at your own risk.

---

## 👤 Author

**Albert Gil**  
PhD Researcher, University of California, Irvine  
https://www.linkedin.com/in/albert-gil/

---

## 📄 License

This project is released under the **GNU General Public License v3.0**.  
See the `LICENSE` file or visit: https://www.gnu.org/licenses/gpl-3.0.html

---

## 📬 Contact

For questions or collaboration opportunities, feel free to open an issue or reach out.
