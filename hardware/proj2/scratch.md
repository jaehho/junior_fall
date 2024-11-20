### Channels & Signal Groups

#### Write Address Channel
- Sends the address of the slave register to be written.
- Signals:
  - `AWVALID`: Indicates the address is valid.
  - `AWREADY`: Slave acknowledges the address.
  - `AWADDR`: The 32-bit address to be accessed.

#### Write Data Channel
- Transfers the data to be written to the slave.
- Signals:
  - `WVALID`: Indicates the data is valid.
  - `WREADY`: Slave acknowledges the data.
  - `WDATA`: The 32-bit data to be written.
  - `WSTRB`: Write strobe bits, specifying which byte lanes are valid.

#### Write Response Channel
- Provides feedback about the write operation.
- Signals:
  - `BVALID`: Indicates the response is valid.
  - `BREADY`: Master acknowledges the response.
  - `BRESP`: Response status (e.g., OKAY, SLVERR).

#### Read Address Channel
- Sends the address of the slave register to be read.
- Signals:
  - `ARVALID`: Indicates the address is valid.
  - `ARREADY`: Slave acknowledges the address.
  - `ARADDR`: The 32-bit address to be accessed.

#### Read Data Channel
- Transfers the read data back to the master.
- Signals:
  - `RVALID`: Indicates the data is valid.
  - `RREADY`: Master acknowledges the data.
  - `RDATA`: The 32-bit data being read.
  - `RRESP`: Response status (e.g., OKAY, SLVERR).

---

### 4. **Handshake Mechanism**
Each channel uses a **VALID/READY handshake** to synchronize data transfer:
- The master asserts the `VALID` signal when it has valid data or an address.
- The slave asserts the `READY` signal when it is ready to accept the data or address.
- The transaction occurs when both `VALID` and `READY` are high.

---

### 5. **Transaction Steps**
#### Write Transaction:
1. Master sends the write address (`AWADDR`), asserts `AWVALID`.
2. Slave asserts `AWREADY` to acknowledge.
3. Master sends the write data (`WDATA`), asserts `WVALID`.
4. Slave asserts `WREADY` to acknowledge.
5. Slave sends a write response (`BRESP`), asserts `BVALID`.
6. Master acknowledges with `BREADY`.

#### Read Transaction:
1. Master sends the read address (`ARADDR`), asserts `ARVALID`.
2. Slave asserts `ARREADY` to acknowledge.
3. Slave sends the read data (`RDATA`) and response (`RRESP`), asserts `RVALID`.
4. Master acknowledges with `RREADY`.
