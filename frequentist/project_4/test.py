if 0:
    def sklearn_pdp(model, X, sorted_importance)
        from sklearn.inspection import PartialDependenceDisplay
        from sklearn.inspection import partial_dependence

        # Initialize sklearn compatible XGBoost regressor
        model.save_model('xgb.json')
        xgb_reg = xgb.XGBRegressor()
        xgb_reg.load_model(fname='xgb.json')

        # Plot partial dependence for selected features
        nonlocation_features = [f for f in sorted_importance.keys() if f not in ['Latitude', 'Longitude']]
        selected_features = nonlocation_features[:4]

        fig, ax = plt.subplots(2, 2, figsize=(7, 7))
        PartialDependenceDisplay.from_estimator(xgb_reg, X, features=selected_features, ax=ax)
        plt.suptitle("Partial Dependence of Housing Value on Selected Features")
        plt.show()

        # Compute partial dependence for 'HouseAge' and 'AveOccup'
        pdp_result = partial_dependence(xgb_reg, X_train, features=['HouseAge', 'AveOccup'], grid_resolution=50)

        # Prepare grid for 3D plotting
        age_grid, occup_grid = np.meshgrid(pdp_result['grid_values'][0], pdp_result['grid_values'][1])
        pdp_average = pdp_result['average'][0]

        # Plot 3D Partial Dependence Plot
        fig, ax = plt.subplots(subplot_kw={'projection': '3d'}, figsize=(10, 7))
        ax.plot_surface(age_grid, occup_grid, pdp_average, cmap='viridis')

        # Label axes
        ax.set_xlabel('HouseAge')
        ax.set_ylabel('AveOccup')
        ax.set_zlabel('Partial Dependence')
        plt.show()