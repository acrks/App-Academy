import { connect } from "react-redux";
import { fetchBenches } from "../util/bench_api_util";
import BenchIndex from "./bench_index"

const mapStateToProps = (state) => ({
    benches: Object.values(fetchBenches())
})

const mapDispatchToProps = (dispatch) => ({
    fetchBenches: benches => dispatch(fetchBenches(benches))
})

export default connect(mapStateToProps, mapDispatchToProps)(BenchIndex)